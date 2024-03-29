Here's the updated feature section with additional features for the `country_picker_pro` package:

# Country Picker Pro

The `country_picker_pro` package provides a customizable Country Selector widget for Flutter
applications.

## Features

- **Country Selection:** Select a country from a list of countries.
- **Preferred Countries:** Display preferred countries at the top of the list.
- **Phone Codes:** Show phone codes for each country.
- **Customization:** Customize the appearance of the widget.
- **Alphabetical Tap to Search:** Quickly search for countries by tapping on an alphabet, similar to contact lists.

## Screenshots

| ![Screenshot 1](https://raw.githubusercontent.com/shirsh94/country_picker_pro/main/assets/Screenshot_first.jpg)  | ![Screenshot 2](https://github.com/shirsh94/country_picker_pro/blob/main/assets/Screenshot_second.jpg?raw=true) | ![Screenshot 3](https://github.com/shirsh94/country_picker_pro/blob/main/assets/Screenshot_third.jpg?raw=true) |
|------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------|
| ![Screenshot 4](https://raw.githubusercontent.com/shirsh94/country_picker_pro/main/assets/Screenshot_fourth.jpg) | ![Screenshot 5](https://github.com/shirsh94/country_picker_pro/blob/main/assets/Screenshot_fifth.jpg?raw=true)  | ![Screenshot 6](https://github.com/shirsh94/country_picker_pro/blob/main/assets/Screenshot_sixth.jpg?raw=true) |

## Installation

Add `country_picker_pro` to your `pubspec.yaml` file:

```yaml
dependencies:
  country_picker_pro: ^0.0.2
```

## Usage

Import the package:

```dart
import 'package:country_picker_pro/country_picker_pro.dart';
```

Use the `CountrySelector` widget to integrate the country selector into your app:

```dart
CountrySelector(
   context: context,
   countryPreferred: <String>['US'],
   showPhoneCode: true,
   appBarTitle: "Select Country",
   onSelect: (Country country) {
     // Handle selected country
   },
   // Add customization options here
);
```

## Customization Options

- **listType:** The type of list to display (ListType.list or ListType.grid).
- **appBarBackgroundColour:** The background color of the app bar.
- **appBarFontSize:** The font size of the app bar title.
- **appBarFontStyle:** The font style of the app bar title.
- **appBarFontWeight:** The font weight of the app bar title.
- **appBarTextColour:** The text color of the app bar title.
- **appBarTextCenterAlign:** Whether the app bar title should be centered.
- **backgroundColour:** The background color of the country selector widget.
- **backIcon:** The icon to use for the back button in the app bar.
- **backIconColour:** The color of the back button icon.
- **countryFontStyle:** The font style of the country names in the list.
- **countryFontWeight:** The font weight of the country names in the list.
- **countryTextColour:** The text color of the country names in the list.
- **countryTitleSize:** The font size of the country names in the list.
- **dividerColour:** The color of the divider between countries in the list.
- **searchBarAutofocus:** Whether the search bar should autofocus.
- **searchBarIcon:** The icon to use for the search bar.
- **searchBarBackgroundColor:** The background color of the search bar.
- **searchBarBorderColor:** The border color of the search bar.
- **searchBarBorderWidth:** The border width of the search bar.
- **searchBarOuterBackgroundColor:** The outer background color of the search bar.
- **searchBarTextColor:** The text color of the search bar.
- **searchBarHintColor:** The hint text color of the search bar.
- **countryTheme:** Additional theme customization options.
- **showSearchBox:** Whether to show the search box.

## Country Details

The `CountrySelector` widget provides detailed information about each country, including:

- `e164_cc`: The e164 country code (e.g., 1 for the United States).
- `iso2_cc`: The ISO 3166-1 alpha-2 country code (e.g., US for the United States).
- `e164_sc`: The e164 subdivision code.
- `geographic`: Indicates if the country is geographically defined.
- `level`: The country's administrative level.
- `name`: The name of the country (e.g., United States).
- `example`: An example phone number for the country (e.g., 2012345678 for the United States).
- `display_name`: The display name of the country, including the ISO code and phone code (e.g.,
  United States (US) [+1]).
- `full_example_with_plus_sign`: The full example phone number including the plus sign (e.g.,
  +12012345678 for the United States).
- `display_name_no_e164_cc`: The display name of the country without the e164 country code (e.g.,
  United States (US)).
- `e164_key`: The e164 key for the country (e.g., 1-US-0 for the United States).
- `capital`: The capital city of the country (e.g., Washington, D.C. for the United States).
- `language`: The official languages of the country (e.g., English for the United States).
- `currency`: The currency used in the country, including the name, code, and symbol (e.g., US
  Dollar (USD) $ for the United States).
- `popular_sports`: A list of popular sports in the country (e.g., American Football, Basketball,
  Baseball for the United States).
- `calling_code`: The international calling code for the country (e.g., +1 for the United States).
- `time_zone`: The time zone of the country (e.g., Multiple Time Zones for the United States).
- `region`: The region of the country (e.g., Americas for the United States).
- `subregion`: The subregion of the country (e.g., Northern America for the United States).
- `demonym`: The demonym(resident) for people from the country (e.g., American for the United States).
- `internet_tld`: The top-level domain for internet addresses from the country (e.g., .us for the
  United States).
- `flag_emoji`: The flag emoji for the country (e.g., 🇺🇸 for the United States).

### For localization:
Add the `CountryLocalizations.delegate` in the list of your app delegates.
```Dart
MaterialApp(
      supportedLocales: [
        const Locale('en'),
      ],
      localizationsDelegates: [
        CountryLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: MainPage(),
 );
```

## Example

```dart
CountrySelector(
    context: context,
    countryPreferred: <String>['US'],
    showPhoneCode: true,
    appBarTitle: "Select Country",
    onSelect: (Country country) {
       debugPrint('Selected country: ${country.displayName}');
       debugPrint('Selected country: ${country.displayName}');
       debugPrint('Selected country code without plus sign: ${country.phoneCode}');
       debugPrint('Select country code with plus sign: ${country.callingCode}');
       debugPrint('Select country countryCode: ${country.countryCode}');
       debugPrint

('Select country capital: ${country.capital}');
       debugPrint('Select country language: ${country.language}');
       debugPrint('Select country currency details: ${country.currency.toString()}');
       debugPrint('Select country popular sports: ${country.popularSports.toString()}');
       debugPrint('Select country time zone: ${country.timeZone}');
       debugPrint('Select country region: ${country.region}');
       debugPrint('Select country sub region: ${country.subregion}');
       debugPrint('Select country place identifier: ${country.resident}');
       debugPrint('Select country Internet top-level domain: ${country.internetTld}');
       debugPrint('Select country flag emoji String: ${country.flagEmojiText}');
       debugPrint('Select country e164Sc: ${country.e164Sc}');
       debugPrint('Select country display Name No Country Code: ${country.displayNameNoCountryCode}');
       debugPrint('Select country display name: ${country.displayName}');
       debugPrint('Select country e164Key: ${country.e164Key}');
     },
   listType: ListType.list,
   appBarBackgroundColour: Colors.black,
   appBarFontSize: 20,
   appBarFontStyle: FontStyle.normal,
   appBarFontWeight: FontWeight.bold,
   appBarTextColour: Colors.white,
   appBarTextCenterAlign: true,
   backgroundColour: Colors.white,
   backIcon: Icons.arrow_back,
   backIconColour: Colors.white,
   countryFontStyle: FontStyle.normal,
   countryFontWeight: FontWeight.bold,
   countryTextColour: Colors.black,
   countryTitleSize: 16,
   dividerColour: Colors.black12,
   searchBarAutofocus: true,
   searchBarIcon: Icons.search,
   searchBarBackgroundColor: Colors.white,
   searchBarBorderColor: Colors.black,
   searchBarBorderWidth: 2,
   searchBarOuterBackgroundColor: Colors.white,
   searchBarTextColor: Colors.black,
   searchBarHintColor: Colors.black,
   countryTheme: const CountryThemeData(
   appBarBorderRadius: 10,
     ),
   showSearchBox:true,
);
```



