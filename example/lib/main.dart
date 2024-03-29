import 'package:country_picker_pro/country_picker_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'example for country_picker_pro package',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      supportedLocales: const [
        Locale('hi'),
        Locale('ne'),
        Locale('uk'),
        Locale('hr'),
        Locale('en'),
        Locale('ar'),
        Locale('es'),
        Locale('de'),
        Locale('fr'),
        Locale('el'),
        Locale('et'),
        Locale('nb'),
        Locale('nn'),
        Locale('tr'),
        Locale('lv'),
        Locale('lt'),
        Locale('ku'),
        Locale('nl'),
        Locale('ko'),
        Locale('ja'),
        Locale('id'),
        Locale('cs'),
        Locale('ht'),
        Locale('sk'),
        Locale('ro'),
        Locale('bg'),
        Locale('it'),
        Locale('pl'),
        Locale('pt'),
        Locale('ru'),
        Locale('ca'),
        Locale('he'),
        Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
        Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
      ],
      localizationsDelegates: const [
        CountryLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo for country Details Picker')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            CountrySelector(
                context: context,
                countryPreferred: <String>['US'],
                showPhoneCode: true,
                appBarTitle: "Select Country",
                onSelect: (Country country) {
                  debugPrint(
                      'Selected country code without plus sign: ${country.phoneCode}');
                  debugPrint(
                      'Select country code with plus sign: ${country.callingCode}');
                  debugPrint(
                      'Select country countryCode: ${country.countryCode}');
                  debugPrint('Select country capital: ${country.capital}');
                  debugPrint('Select country language: ${country.language}');
                  debugPrint(
                      'Select country currency details: ${country.currency.toString()}');
                  debugPrint(
                      'Select country popular sports: ${country.popularSports.toString()}');
                  debugPrint('Select country time zone: ${country.timeZone}');
                  debugPrint('Select country region: ${country.region}');
                  debugPrint('Select country sub region: ${country.subregion}');
                  debugPrint(
                      'Select country place identifier: ${country.resident}');
                  debugPrint(
                      'Select country Internet top-level domain: ${country.internetTld}');
                  debugPrint(
                      'Select country flag emoji String: ${country.flagEmojiText}');
                  debugPrint('Select country e164Sc: ${country.e164Sc}');
                  debugPrint(
                      'Select country display Name No Country Code: ${country.displayNameNoCountryCode}');
                  debugPrint(
                      'Select country display name: ${country.displayName}');
                  debugPrint('Select country e164Key: ${country.e164Key}');
                },
                listType: ListType.list,
                appBarBackgroundColour: Colors.indigo,
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
                alphabetScrollEnabledWidget: true,
                showSearchBox: true);
          },
          child: const Text('Country Picker'),
        ),
      ),
    );
  }
}
