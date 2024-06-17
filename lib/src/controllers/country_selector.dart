import 'package:flutter/material.dart';

import '../country.dart';
import '../view/country_view.dart';
import '../view/country_list_view.dart';
export '../country.dart';
export '../view/country_list_view.dart' show CustomFlagBuilder;
export '../country_localizations.dart';
export '../country_decoder.dart';
export 'country_provider.dart';

/// Enum representing the type of list to display.
enum ListType {
  list, // Display as a list.
  grid, // Display as a grid.
}

enum ViewType {
  screen, // Display in new screen.
  //popup, // Display inside a popup in current screen.
  bottomsheet, // Display inside a bottomsheet in current screen.
}

/// Utility class containing helper methods.
class Util {
  /// Converts a country code to its corresponding flag emoji.
  static String countryCodeToEmoji(String countryCode) {
    final int firstLetter = countryCode.codeUnitAt(0) - 0x41 + 0x1F1E6;
    final int secondLetter = countryCode.codeUnitAt(1) - 0x41 + 0x1F1E6;
    return String.fromCharCode(firstLetter) + String.fromCharCode(secondLetter);
  }
}

/// Extension on String to provide an image path based on the string value.
extension StringExtensions on String {
  String get imagePath => 'lib/src/res/assets/$this';
}

/// Function to display a country selector widget.
void CountrySelector({
  required BuildContext context,
  required ValueChanged<Country> onSelect,
  ViewType? viewType = ViewType.screen,
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
  Color? searchBarBackgroundColor,
  Color? searchBarTextColor,
  Color? searchBarBorderColor,
  Color? searchBarOuterBackgroundColor,
  Color? searchBarHintColor,
  double? searchBarBorderWidth,
  IconData? searchBarIcon,
  EdgeInsetsGeometry? searchBoxPadding,
  ListType listType = ListType.list,
  bool alphabetScrollEnabledWidget = true,
  bool showDragBar = true,
  Widget? customDragBar,
  double? borderRadius,
}) {
  // Assert that either remove or countrySorter is provided, not both.
  assert(
    remove == null || countrySorter == null,
    'Cannot provide both remove and countrySorter',
  );
  // Call the showCountryListView function with the provided parameters.
  showCountryListView(
    context: context,
    viewType: viewType,
    showDragBar: showDragBar,
    customDragBar: customDragBar,
    borderRadius: borderRadius,
    onSelect: onSelect,
    onClosed: onClosed,
    remove: remove,
    countryPreferred: countryPreferred,
    countrySorter: countrySorter,
    showPhoneCode: showPhoneCode,
    customFlagBuilder: customFlagBuilder,
    countryTheme: countryTheme,
    searchBarAutofocus: searchBarAutofocus,
    showWorldWide: showWorldWide,
    showSearchBox: showSearchBox,
    useSafeArea: useSafeArea,
    useRootNavigator: useRootNavigator,
    countryTextColour: countryTextColour,
    countryTitleSize: countryTitleSize,
    countryFontWeight: countryFontWeight,
    countryFontStyle: countryFontStyle,
    appBarTitle: appBarTitle,
    appBarTextColour: appBarTextColour,
    appBarBackgroundColour: appBarBackgroundColour,
    appBarFontSize: appBarFontSize,
    appBarFontWeight: appBarFontWeight,
    appBarFontStyle: appBarFontStyle,
    backgroundColour: backgroundColour,
    backIcon: backIcon,
    backIconColour: backIconColour,
    appBarTextCenterAlign: appBarTextCenterAlign,
    dividerColour: dividerColour,
    searchBarBackgroundColor: searchBarBackgroundColor,
    searchBarTextColor: searchBarTextColor,
    searchBarBorderColor: searchBarBorderColor,
    searchBarOuterBackgroundColor: searchBarOuterBackgroundColor,
    searchBarHintColor: searchBarHintColor,
    searchBarBorderWidth: searchBarBorderWidth,
    searchBarIcon: searchBarIcon,
    alphabetScrollEnabledWidget: alphabetScrollEnabledWidget,
    searchBoxPadding: searchBoxPadding,
    listType: listType,
  );
}
