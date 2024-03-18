## [0.0.1] - Initial Release
- Provides a customizable Country Selector widget for Flutter applications.
- Features country selection from a list of countries.
- Displays preferred countries at the top of the list.
- Shows phone codes for each country.
- Offers customization options for appearance.
- Supports installation via `pubspec.yaml` file.

### Added
- `CountrySelector` widget for integrating the country selector.
- `listType` customization option for specifying the type of list to display.
- `appBarBackgroundColour` customization option for setting the background color of the app bar.
- `appBarFontSize` customization option for setting the font size of the app bar title.
- `appBarFontStyle` customization option for setting the font style of the app bar title.
- `appBarFontWeight` customization option for setting the font weight of the app bar title.
- `appBarTextColour` customization option for setting the text color of the app bar title.
- `appBarTextCenterAlign` customization option for centering the app bar title.
- `backgroundColour` customization option for setting the background color of the country selector widget.
- `backIcon` customization option for setting the icon for the back button in the app bar.
- `backIconColour` customization option for setting the color of the back button icon.
- `countryFontStyle` customization option for setting the font style of the country names in the list.
- `countryFontWeight` customization option for setting the font weight of the country names in the list.
- `countryTextColour` customization option for setting the text color of the country names in the list.
- `countryTitleSize` customization option for setting the font size of the country names in the list.
- `dividerColour` customization option for setting the color of the divider between countries in the list.
- `searchBarAutofocus` customization option for setting whether the search bar should autofocus.
- `searchBarIcon` customization option for setting the icon for the search bar.
- `searchBarBackgroundColor` customization option for setting the background color of the search bar.
- `searchBarBorderColor` customization option for setting the border color of the search bar.
- `searchBarBorderWidth` customization option for setting the border width of the search bar.
- `searchBarOuterBackgroundColor` customization option for setting the outer background color of the search bar.
- `searchBarTextColor` customization option for setting the text color of the search bar.
- `searchBarHintColor` customization option for setting the hint text color of the search bar.
- `countryTheme` customization option for additional theme customization.
- `showSearchBox` customization option for showing the search box.

### Usage
- Added usage example for integrating the `CountrySelector` widget into Flutter apps.

### Localization
- Added support for localization using `CountryLocalizations.delegate`.

### Country Details
- Provided detailed information about each country including e164 country code, ISO code, phone code, etc.

### Deprecated
- Deprecated the `CountryPicker` widget in favor of `CountrySelector`.