import 'package:flutter/material.dart';
import 'res/translatedString/he.dart';
import 'res/translatedString/hr.dart';
import 'res/translatedString/ku.dart';
import 'res/translatedString/id.dart';
import 'res/translatedString/it.dart';
import 'res/translatedString/ja.dart';
import 'res/translatedString/ko.dart';
import 'res/translatedString/ru.dart';
import 'res/translatedString/sk.dart';
import 'res/translatedString/tr.dart';
import 'res/translatedString/tw.dart';
import 'res/translatedString/uk.dart';
import 'res/translatedString/nb.dart';
import 'res/translatedString/lt.dart';
import 'res/translatedString/lv.dart';
import 'res/translatedString/et.dart';
import 'res/translatedString/fr.dart';
import 'res/translatedString/gr.dart';
import 'res/translatedString/nn.dart';
import 'res/translatedString/np.dart';
import 'res/translatedString/pl.dart';
import 'res/translatedString/pt.dart';
import 'res/translatedString/ro.dart';
import 'res/translatedString/cn.dart';
import 'res/translatedString/cs.dart';
import 'res/translatedString/ht.dart';
import 'res/translatedString/nl.dart';
import 'res/translatedString/ar.dart';
import 'res/translatedString/bg.dart';
import 'res/translatedString/ca.dart';
import 'res/translatedString/de.dart';
import 'res/translatedString/en.dart';
import 'res/translatedString/es.dart';

// Class for handling country localizations
class CountryLocalizations {
  final Locale locale;

  // Constructor
  CountryLocalizations(this.locale);

  // Static method for getting localized resources
  static CountryLocalizations? of(BuildContext context) {
    return Localizations.of<CountryLocalizations>(
      context,
      CountryLocalizations,
    );
  }

  // LocalizationsDelegate for CountryLocalizations
  static const LocalizationsDelegate<CountryLocalizations> delegate =
  _CountryLocalizationsDelegate();

  // Method for retrieving country name based on country code
  String? countryName({required String countryCode}) {
    switch (locale.languageCode) {
      case 'zh':
        switch (locale.scriptCode) {
          case 'Hant':
            return tw[countryCode];
          case 'Hans':
          default:
            return cn[countryCode];
        }
      case 'el':
        return gr[countryCode];
      case 'es':
        return es[countryCode];
      case 'et':
        return et[countryCode];
      case 'he':
        return he[countryCode];
      case 'pt':
        return pt[countryCode];
      case 'nb':
        return nb[countryCode];
      case 'nn':
        return nn[countryCode];
      case 'uk':
        return uk[countryCode];
      case 'pl':
        return pl[countryCode];
      case 'tr':
        return tr[countryCode];
      case 'ro':
        return ro[countryCode];
      case 'ru':
        return ru[countryCode];
      case 'sk':
        return sk[countryCode];
      case 'hi':
      case 'ne':
        return np[countryCode];
      case 'ar':
        return ar[countryCode];
      case 'bg':
        return bg[countryCode];
      case 'ku':
        return ku[countryCode];
      case 'hr':
        return hr[countryCode];
      case 'ht':
        return ht[countryCode];
      case 'fr':
        return fr[countryCode];
      case 'de':
        return de[countryCode];
      case 'lv':
        return lv[countryCode];
      case 'lt':
        return lt[countryCode];
      case 'nl':
        return nl[countryCode];
      case 'it':
        return it[countryCode];
      case 'ko':
        return ko[countryCode];
      case 'ja':
        return ja[countryCode];
      case 'id':
        return id[countryCode];
      case 'cs':
        return cs[countryCode];
      case 'ca':
        return ca[countryCode];
      case 'en':
      default:
        return en[countryCode];
    }
  }
}

// Delegate for CountryLocalizations
class _CountryLocalizationsDelegate
    extends LocalizationsDelegate<CountryLocalizations> {
  const _CountryLocalizationsDelegate();

  // Check if the locale is supported
  @override
  bool isSupported(Locale locale) {
    return [
      'hi',
      'ne',
      'tr',
      'hr',
      'ht',
      'fr',
      'en',
      'ar',
      'bg',
      'ku',
      'zh',
      'el',
      'es',
      'et',
      'he',
      'pl',
      'pt',
      'nb',
      'nn',
      'ro',
      'ru',
      'sk',
      'uk',
      'de',
      'lt',
      'lv',
      'nl',
      'it',
      'ko',
      'ja',
      'id',
      'cs',
      'ca'
    ].contains(locale.languageCode);
  }

  // Load the CountryLocalizations based on the locale
  @override
  Future<CountryLocalizations> load(Locale locale) {
    final CountryLocalizations localizations = CountryLocalizations(locale);
    return Future.value(localizations);
  }

  // Check if the delegate should reload
  @override
  bool shouldReload(_CountryLocalizationsDelegate old) => false;
}
