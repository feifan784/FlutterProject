import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

class I18nDemoLocalizations {
  final Locale locale;

  I18nDemoLocalizations(this.locale);

  static I18nDemoLocalizations of(BuildContext context) {
    return Localizations.of<I18nDemoLocalizations>(
        context, I18nDemoLocalizations);
  }

  static Map<String, Map<String, String>> _localized = {
    'en': {'title': 'hello'},
    'zh': {'title': '您好'}
  };

  String get title {
    return _localized[locale.languageCode]['title'];
  }
}

class I18nDemoLocalizationsDelegate extends LocalizationsDelegate {
  I18nDemoLocalizationsDelegate();

  @override
  Future<I18nDemoLocalizations> load(Locale locale) {
    return SynchronousFuture<I18nDemoLocalizations>(
        I18nDemoLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) {
    return true;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<dynamic> old) {
    return false;
  }
}
