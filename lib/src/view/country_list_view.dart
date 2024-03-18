import 'package:country_picker_pro/src/controllers/country_selector.dart';
import 'package:country_picker_pro/src/res/country_json.dart';
import 'package:country_picker_pro/src/view/country_view.dart';
import 'package:flutter/material.dart';

typedef CustomFlagBuilder = Widget Function(Country country);

// ignore: must_be_immutable
class CountryListView extends StatefulWidget {
  final ValueChanged<Country> onSelect;

  final bool showPhoneCode;

  final List<String>? remove;

  final List<String>? countrySorter;

  final List<String>? countryPreferred;

  final CountryThemeData? countryTheme;

  final bool searchBarAutofocus;

  final bool showWorldWide;

  final bool showSearchBox;

  final CustomFlagBuilder? customFlagBuilder;

  Color? countryTextColour;
  double? countryTitleSize;
  FontWeight? countryFontWeight;
  FontStyle? countryFontStyle;
  Color? backgroundColour;
  Color? dividerColour;
  Color? appBarBackgroundColour;
  Color? searchBarBackgroundColor;
  Color? searchBarTextColor;
  Color? searchBarHintColor;
  Color? searchBarBorderColor;
  Color? searchBarOuterBackgroundColor;
  double? appBarBorderRadius;
  double? searchBarBorderWidth;
  ListType listType;
  IconData? searchBarIcon;
  EdgeInsetsGeometry? searchBoxPadding;

  CountryListView({
    Key? key,
    required this.onSelect,
    this.remove,
    this.countryPreferred,
    this.countrySorter,
    this.showPhoneCode = false,
    this.countryTheme,
    this.searchBarAutofocus = false,
    this.showWorldWide = false,
    this.showSearchBox = true,
    this.customFlagBuilder,
    this.countryTextColour,
    this.countryTitleSize,
    this.countryFontWeight,
    this.countryFontStyle,
    this.backgroundColour,
    this.appBarBackgroundColour,
    this.appBarBorderRadius,
    this.dividerColour,
    this.listType = ListType.list,
    this.searchBarBackgroundColor,
    this.searchBarTextColor,
    this.searchBarBorderColor,
    this.searchBarOuterBackgroundColor,
    this.searchBarBorderWidth,
    this.searchBarIcon,
    this.searchBoxPadding,
    this.searchBarHintColor,
  })  : assert(
          remove == null || countrySorter == null,
          'Cannot provide both remove and countrySorter',
        ),
        super(key: key);

  @override
  State<CountryListView> createState() => _CountryListViewState();
}

class _CountryListViewState extends State<CountryListView> {
  final CountryProvider _countryProvider = CountryProvider();
  late List<Country> _countryList;
  late List<Country> _filteredList;
  List<Country>? _countryPreferredList;
  late TextEditingController _searchController;
  late bool _searchBarAutofocus;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();

    _countryList = _countryProvider.getAll();

    _countryList =
        countryCodes.map((country) => Country.from(json: country)).toList();

    if (!widget.showPhoneCode) {
      final ids = _countryList.map((e) => e.countryCode).toSet();
      _countryList.retainWhere((country) => ids.remove(country.countryCode));
    }

    if (widget.countryPreferred != null) {
      _countryPreferredList =
          _countryProvider.findCountriesByCode(widget.countryPreferred!);
    }

    if (widget.remove != null) {
      _countryList.removeWhere(
        (element) => widget.remove!.contains(element.countryCode),
      );
    }

    if (widget.countrySorter != null) {
      _countryList.removeWhere(
        (element) => !widget.countrySorter!.contains(element.countryCode),
      );
    }

    _filteredList = <Country>[];
    if (widget.showWorldWide) {
      _filteredList.add(Country.globalProvider);
    }
    _filteredList.addAll(_countryList);

    _searchBarAutofocus = widget.searchBarAutofocus;
  }

  @override
  Widget build(BuildContext context) {
    final String searchLabel =
        CountryLocalizations.of(context)?.countryName(countryCode: 'search') ??
            'Search';

    return Container(
      color: widget.searchBarOuterBackgroundColor ?? Colors.white,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 12),
          if (widget.showSearchBox)
            Theme(
              data: ThemeData(
                  colorScheme: ColorScheme(
                background: Colors.white,
                brightness: Brightness.light,
                primary: widget.searchBarHintColor ?? Colors.black,
                onPrimary: Colors.white,
                secondary: Colors.white,
                onSecondary: Colors.white,
                error: Colors.white,
                onError: Colors.white,
                onBackground: Colors.white,
                surface: Colors.white,
                onSurface: widget.searchBarTextColor ?? Colors.white,
              )),
              child: Padding(
                padding: widget.searchBoxPadding ??
                    const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 10.0, 10.0),
                child: TextField(
                  autofocus: _searchBarAutofocus,
                  controller: _searchController,
                  keyboardType: TextInputType.multiline,
                  onChanged: _filterSearchResults,
                  decoration: InputDecoration(
                    labelText: searchLabel,
                    hintText: searchLabel,
                    prefixIcon: Icon(
                      widget.searchBarIcon ?? Icons.search,
                      color: widget.searchBarTextColor ?? Colors.black,
                    ),
                    hintStyle: TextStyle(
                        color: widget.searchBarTextColor ?? Colors.black),
                    border: const OutlineInputBorder(),
                    isDense: true,
                    filled: true,
                    fillColor: widget.searchBarBackgroundColor ?? Colors.white,
                    // Set your desired background color here
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: widget.searchBarBorderWidth ?? 2.0,
                          color: widget.searchBarBorderColor ?? Colors.black),
                      borderRadius: BorderRadius.circular(
                          widget.appBarBorderRadius ?? 10),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: widget.searchBarBorderColor ?? Colors.black,
                            width: widget.searchBarBorderWidth ?? 2.0),
                        borderRadius: BorderRadius.circular(
                            widget.appBarBorderRadius ?? 10)),
                  ),
                ),
              ),
            ),
          Expanded(
            child: widget.listType == ListType.list
                ? ListView(
                    children: [
                      if (_countryPreferredList != null) ...[
                        ..._countryPreferredList!.map<Widget>((currency) =>
                            _listItem(
                                currency,
                                widget.countryTextColour,
                                widget.countryTitleSize,
                                widget.countryFontWeight,
                                widget.countryFontStyle,
                                widget.dividerColour,
                                widget.listType,
                                widget.backgroundColour))
                      ],
                      ..._filteredList.map<Widget>((country) => _listItem(
                          country,
                          widget.countryTextColour,
                          widget.countryTitleSize,
                          widget.countryFontWeight,
                          widget.countryFontStyle,
                          widget.dividerColour,
                          widget.listType,
                          widget.backgroundColour))
                    ],
                  )
                : GridView.extent(
                    primary: false,
                    childAspectRatio: (1 / .85),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    maxCrossAxisExtent: 200.0,
                    children: <Widget>[
                      if (_countryPreferredList != null) ...[
                        ..._countryPreferredList!.map<Widget>((currency) =>
                            _listItem(
                                currency,
                                widget.countryTextColour,
                                widget.countryTitleSize,
                                widget.countryFontWeight,
                                widget.countryFontStyle,
                                widget.dividerColour,
                                widget.listType,
                                widget.backgroundColour))
                      ],
                      ..._filteredList.map<Widget>((country) => _listItem(
                          country,
                          widget.countryTextColour,
                          widget.countryTitleSize,
                          widget.countryFontWeight,
                          widget.countryFontStyle,
                          widget.dividerColour,
                          widget.listType,
                          widget.backgroundColour))
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Widget _listItem(
      Country country,
      Color? countryTextColour,
      double? countryTitleSize,
      FontWeight? countryFontWeight,
      FontStyle? countryFontStyle,
      Color? dividerColour,
      ListType listType,
      Color? backgroundColour) {
    final bool isRtl = Directionality.of(context) == TextDirection.rtl;
    if (listType == ListType.list) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Material(
            color: backgroundColour ?? Colors.white,
            child: InkWell(
              onTap: () {
                country.nameLocalized = CountryLocalizations.of(context)
                    ?.countryName(countryCode: country.countryCode)
                    ?.replaceAll(RegExp(r"\s+"), " ");
                widget.onSelect(country);
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: <Widget>[
                    const SizedBox(width: 20),
                    if (widget.customFlagBuilder == null)
                      _flagView(country, listType)
                    else
                      widget.customFlagBuilder!(country),
                    if (widget.showPhoneCode && !country.iswWorldWide) ...[
                      const SizedBox(width: 15),
                      SizedBox(
                        width: 45,
                        child: Text(
                          '${isRtl ? '' : '+'}${country.phoneCode}${isRtl ? '+' : ''}',
                          style: TextStyle(
                              color: countryTextColour ?? Colors.black,
                              fontSize: countryTitleSize ?? 16,
                              fontStyle: countryFontStyle ?? FontStyle.normal,
                              fontWeight:
                                  countryFontWeight ?? FontWeight.normal),
                        ),
                      ),
                      const SizedBox(width: 5),
                    ] else
                      const SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        CountryLocalizations.of(context)
                                ?.countryName(countryCode: country.countryCode)
                                ?.replaceAll(RegExp(r"\s+"), " ") ??
                            country.name,
                        style: TextStyle(
                            color: countryTextColour ?? Colors.black,
                            fontSize: countryTitleSize ?? 16,
                            fontStyle: countryFontStyle ?? FontStyle.normal,
                            fontWeight: countryFontWeight ?? FontWeight.normal),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Divider(height: 1, color: dividerColour ?? Colors.black12),
        ],
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: dividerColour ?? Colors.black12,
            width: 1.0,
          ),
        ),
        child: Material(
          color: backgroundColour ?? Colors.white,
          child: InkWell(
            onTap: () {
              country.nameLocalized = CountryLocalizations.of(context)
                  ?.countryName(countryCode: country.countryCode)
                  ?.replaceAll(RegExp(r"\s+"), " ");
              widget.onSelect(country);
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                children: <Widget>[
                  const SizedBox(width: 20),
                  if (widget.customFlagBuilder == null)
                    _flagView(country, listType)
                  else
                    widget.customFlagBuilder!(country),
                  if (widget.showPhoneCode && !country.iswWorldWide) ...[
                    const SizedBox(width: 15),
                    SizedBox(
                      width: 45,
                      child: Text(
                        '${isRtl ? '' : '+'}${country.phoneCode}${isRtl ? '+' : ''}',
                        style: TextStyle(
                            color: countryTextColour ?? Colors.black,
                            fontSize: countryTitleSize ?? 16,
                            fontWeight: countryFontWeight ?? FontWeight.normal),
                      ),
                    ),
                    const SizedBox(width: 5),
                  ] else
                    const SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      CountryLocalizations.of(context)
                              ?.countryName(countryCode: country.countryCode)
                              ?.replaceAll(RegExp(r"\s+"), " ") ??
                          country.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: countryTextColour ?? Colors.black,
                          fontSize: countryTitleSize ?? 16,
                          fontWeight: countryFontWeight ?? FontWeight.normal),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget _flagView(Country country, ListType listType) {
    final bool isRtl = Directionality.of(context) == TextDirection.rtl;
    return SizedBox(
      width: isRtl ? 50 : null,
      child: listType == ListType.list
          ? _emojiTextList(country)
          : _emojiTextGrid(country),
    );
  }

  Widget _emojiTextList(Country country) => Text(
        country.iswWorldWide
            ? '\uD83C\uDF0D'
            : Util.countryCodeToEmoji(country.countryCode),
        style: TextStyle(
          fontSize: widget.countryTheme?.flagSize ?? 25,
          fontFamilyFallback: widget.countryTheme?.emojiFontFamilyFallback,
        ),
      );

  Widget _emojiTextGrid(Country country) => Text(
        country.iswWorldWide
            ? '\uD83C\uDF0D'
            : Util.countryCodeToEmoji(country.countryCode),
        style: TextStyle(
          fontSize: widget.countryTheme?.flagSize ?? 50,
          fontFamilyFallback: widget.countryTheme?.emojiFontFamilyFallback,
        ),
      );

  void _filterSearchResults(String query) {
    List<Country> searchResult = <Country>[];
    final CountryLocalizations? localizations =
        CountryLocalizations.of(context);

    if (query.isEmpty) {
      searchResult.addAll(_countryList);
    } else {
      searchResult = _countryList
          .where((c) => c.startsWith(query, localizations))
          .toList();
    }

    setState(() => _filteredList = searchResult);
  }
}
