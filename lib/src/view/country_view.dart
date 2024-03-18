import 'package:country_picker_pro/src/controllers/country_selector.dart';
import 'package:flutter/material.dart';
import 'country_list_view.dart';

class CountryThemeData {
  final double? flagSize;
  final List<String>? emojiFontFamilyFallback;
  final double? appBarBorderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  const CountryThemeData({
    this.flagSize,
    this.appBarBorderRadius,
    this.padding,
    this.margin,
    this.emojiFontFamilyFallback,
  });
}

void showCountryListView({
  required BuildContext context,
  required ValueChanged<Country> onSelect,
  VoidCallback? onClosed,
  List<String>? countryPreferred,
  List<String>? remove,
  List<String>? countrySorter,
  bool showPhoneCode = false,
  CustomFlagBuilder? customFlagBuilder,
  CountryThemeData? countryTheme,
  bool searchBarAutofocus = false,
  bool showWorldWide = false,
  bool showSearchBox = true,
  bool useSafeArea = false,
  bool useRootNavigator = false,
  Color? countryTextColour,
  double? countryTitleSize,
  FontWeight? countryFontWeight,
  FontStyle? countryFontStyle,
  String? appBarTitle,
  Color? appBarTextColour,
  Color? appBarBackgroundColour,
  double? appBarFontSize,
  FontWeight? appBarFontWeight,
  FontStyle? appBarFontStyle,
  Color? backgroundColour,
  IconData? backIcon,
  Color? backIconColour,
  bool? appBarTextCenterAlign,
  Color? dividerColour,
  ListType listType = ListType.list,
  Color? searchBarBackgroundColor,
  Color? searchBarTextColor,
  Color? searchBarBorderColor,
  Color? searchBarOuterBackgroundColor,
  Color? searchBarHintColor,
  double? searchBarBorderWidth,
  IconData? searchBarIcon,
  EdgeInsetsGeometry? searchBoxPadding,
}) {
  Navigator.of(context)
      .push(
    MaterialPageRoute(
      fullscreenDialog: true,
      builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: backIconColour ?? Colors.transparent,
          appBar: AppBar(
            centerTitle: appBarTextCenterAlign ?? true,
            backgroundColor: appBarBackgroundColour ?? Colors.black,
            title: Text(
              appBarTitle ?? 'Select Country',
              style: TextStyle(
                color: appBarTextColour ?? Colors.white,
                fontSize: appBarFontSize ?? 20,
                fontWeight: appBarFontWeight ?? FontWeight.bold,
                fontStyle: appBarFontStyle ?? FontStyle.normal,
              ),
            ),
            leading: IconButton(
              icon: Icon(
                backIcon ?? Icons.arrow_back,
                color: backIconColour ?? Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: _viewData(
              context,
              onSelect,
              countryPreferred,
              remove,
              countrySorter,
              showPhoneCode,
              countryTheme,
              searchBarAutofocus,
              showWorldWide,
              showSearchBox,
              customFlagBuilder,
              countryTextColour,
              countryTitleSize,
              countryFontWeight,
              countryFontStyle,
              backgroundColour,
              appBarBackgroundColour,
              dividerColour,
              listType,
              searchBarBackgroundColor,
              searchBarTextColor,
              searchBarBorderColor,
              searchBarOuterBackgroundColor,
              searchBarBorderWidth,
              searchBarIcon,
              searchBoxPadding,
              searchBarHintColor),
        );
      },
    ),
  )
      .then((value) {
    if (onClosed != null) onClosed();
  });
}

Widget _viewData(
  BuildContext context,
  ValueChanged<Country> onSelect,
  List<String>? countryPreferred,
  List<String>? remove,
  List<String>? countrySorter,
  bool showPhoneCode,
  CountryThemeData? countryTheme,
  bool searchBarAutofocus,
  bool showWorldWide,
  bool showSearchBox,
  CustomFlagBuilder? customFlagBuilder,
  Color? countryTextColour,
  double? countryTitleSize,
  FontWeight? countryFontWeight,
  FontStyle? countryFontStyle,
  Color? backgroundColour,
  Color? appBarBackgroundColour,
  Color? dividerColour,
  ListType listType,
  Color? searchBarBackgroundColor,
  Color? searchBarTextColor,
  Color? searchBarBorderColor,
  Color? searchBarOuterBackgroundColor,
  double? searchBarBorderWidth,
  IconData? searchBarIcon,
  EdgeInsetsGeometry? searchBoxPadding,
  Color? searchBarHintColor,
) {
  final BorderRadius borderRadius = BorderRadius.only(
    topLeft: Radius.circular(countryTheme?.appBarBorderRadius ?? 10.0),
    topRight: Radius.circular(countryTheme?.appBarBorderRadius ?? 10.0),
  );

  return Container(
    padding: countryTheme?.padding,
    margin: countryTheme?.margin,
    decoration: BoxDecoration(
      borderRadius: borderRadius,
    ),
    child: CountryListView(
      onSelect: onSelect,
      remove: remove,
      countryPreferred: countryPreferred,
      countrySorter: countrySorter,
      showPhoneCode: showPhoneCode,
      countryTheme: countryTheme,
      searchBarAutofocus: searchBarAutofocus,
      showWorldWide: showWorldWide,
      showSearchBox: showSearchBox,
      customFlagBuilder: customFlagBuilder,
      countryTextColour: countryTextColour,
      countryTitleSize: countryTitleSize,
      countryFontWeight: countryFontWeight,
      countryFontStyle: countryFontStyle,
      backgroundColour: backgroundColour,
      appBarBackgroundColour: appBarBackgroundColour,
      appBarBorderRadius: countryTheme?.appBarBorderRadius,
      dividerColour: dividerColour,
      listType: listType,
      searchBarBackgroundColor: searchBarBackgroundColor,
      searchBarTextColor: searchBarTextColor,
      searchBarBorderColor: searchBarBorderColor,
      searchBarOuterBackgroundColor: searchBarOuterBackgroundColor,
      searchBarHintColor: searchBarHintColor,
      searchBarBorderWidth: searchBarBorderWidth,
      searchBarIcon: searchBarIcon,
      searchBoxPadding: searchBoxPadding,
    ),
  );
}
