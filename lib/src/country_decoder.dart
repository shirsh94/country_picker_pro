import 'package:country_picker_pro/src/controllers/country_selector.dart';
import 'package:country_picker_pro/src/res/translatedString/he.dart';
import 'package:flutter/material.dart';

import 'res/country_json.dart';
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

class CountryDecoder {
  static Country parse(String country) {
    return tryParseCountryCode(country) ?? parseCountryName(country);
  }

  static Country? tryParse(String country) {
    return tryParseCountryCode(country) ?? tryParseCountryName(country);
  }

  static Country parseCountryCode(String countryCode) {
    return _getFromCode(countryCode.toUpperCase());
  }

  static Country parsePhoneCode(String phoneCode) {
    return _getFromPhoneCode(phoneCode);
  }

  static Country? tryParseCountryCode(String countryCode) {
    try {
      return parseCountryCode(countryCode);
    } catch (_) {
      return null;
    }
  }

  static Country? tryParsePhoneCode(String phoneCode) {
    try {
      return parsePhoneCode(phoneCode);
    } catch (_) {
      return null;
    }
  }

  static Country parseCountryName(
    String countryName, {
    BuildContext? context,
    List<Locale>? locales,
  }) {
    final String countryNameLower = countryName.toLowerCase();

    final CountryLocalizations? localizations =
        context != null ? CountryLocalizations.of(context) : null;

    final String languageCode = _anyLocalizedNameToCode(
      countryNameLower,
      localizations?.locale,
      locales,
    );

    return _getFromCode(languageCode);
  }

  static Country? tryParseCountryName(
    String countryName, {
    BuildContext? context,
    List<Locale>? locales,
  }) {
    try {
      return parseCountryName(countryName, context: context, locales: locales);
    } catch (_) {
      return null;
    }
  }

  static Country _getFromPhoneCode(String phoneCode) {
    return Country.from(
      json: countryCodes.singleWhere(
        (Map<String, dynamic> c) => c['e164_cc'] == phoneCode,
      ),
    );
  }

  static Country _getFromCode(String countryCode) {
    return Country.from(
      json: countryCodes.singleWhere(
        (Map<String, dynamic> c) => c['iso2_cc'] == countryCode,
      ),
    );
  }

  static String _anyLocalizedNameToCode(
    String name,
    Locale? locale,
    List<Locale>? locales,
  ) {
    String? code;

    if (locale != null) code = _localizedNameToCode(name, locale);
    if (code == null && locales == null) {
      code = _localizedNameToCode(name, const Locale('en'));
    }
    if (code != null) return code;

    final List<Locale> localeList = locales ?? <Locale>[];

    if (locales == null) {
      final List<Locale> exclude = <Locale>[const Locale('en')];
      if (locale != null) exclude.add(locale);
      localeList.addAll(_supportedLanguages(exclude: exclude));
    }

    return _nameToCodeFromGivenLocales(name, localeList);
  }

  static String _nameToCodeFromGivenLocales(String name, List<Locale> locales) {
    String? code;

    for (int i = 0; i < locales.length && code == null; i++) {
      code = _localizedNameToCode(name, locales[i]);
    }

    if (code == null) {
      throw ArgumentError.value('No country found');
    }

    return code;
  }

  static String? _localizedNameToCode(String name, Locale locale) {
    final Map<String, String> translation = _getTranslation(locale);

    String? code;

    translation.forEach((key, value) {
      if (value.toLowerCase() == name) code = key;
    });

    return code;
  }

  static Map<String, String> _getTranslation(Locale locale) {
    switch (locale.languageCode) {
      case 'zh':
        switch (locale.scriptCode) {
          case 'Hant':
            return tw;
          case 'Hans':
          default:
            return cn;
        }
      case 'hi':
      case 'ne':
        return np;
      case 'fr':
        return fr;
      case 'de':
        return de;
      case 'lv':
        return lv;
      case 'lt':
        return lt;
      case 'el':
        return gr;
      case 'ar':
        return ar;
      case 'bg':
        return bg;
      case 'ku':
        return ku;
      case 'es':
        return es;
      case 'et':
        return et;
      case 'pt':
        return pt;
      case 'nb':
        return nb;
      case 'nn':
        return nn;
      case 'uk':
        return uk;
      case 'pl':
        return pl;
      case 'tr':
        return tr;
      case 'hr':
        return hr;
      case 'ht':
        return ht;
      case 'ro':
        return ro;
      case 'ru':
        return ru;
      case 'sk':
        return sk;
      case 'nl':
        return nl;
      case 'it':
        return it;
      case 'ja':
        return ja;
      case 'id':
        return id;
      case 'ko':
        return ko;
      case 'cs':
        return cs;
      case 'ca':
        return ca;
      case 'he':
        return he;
      case 'en':
      default:
        return en;
    }
  }

  static List<Locale> _supportedLanguages({
    List<Locale> exclude = const <Locale>[],
  }) {
    return <Locale>[
      const Locale('hi'),
      const Locale('ne'),
      const Locale('uk'),
      const Locale('tr'),
      const Locale('hr'),
      const Locale('ht'),
      const Locale('de'),
      const Locale('lv'),
      const Locale('lv'),
      const Locale('nl'),
      const Locale('en'),
      const Locale('ar'),
      const Locale('bg'),
      const Locale('ku'),
      const Locale('es'),
      const Locale('el'),
      const Locale('et'),
      const Locale('fr'),
      const Locale('nb'),
      const Locale('nn'),
      const Locale('pl'),
      const Locale('pt'),
      const Locale('ro'),
      const Locale('ru'),
      const Locale('sk'),
      const Locale('id'),
      const Locale('ja'),
      const Locale('ko'),
      const Locale('cs'),
      const Locale('ca'),
      const Locale('he'),
      const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
      const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
    ]..removeWhere((Locale l) => exclude.contains(l));
  }
}
