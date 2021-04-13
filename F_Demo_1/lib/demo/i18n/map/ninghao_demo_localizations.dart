import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

class NingHaoDemoLocalizations {
  final Locale locale;

  NingHaoDemoLocalizations(this.locale);

  static NingHaoDemoLocalizations of(BuildContext context) {
    return Localizations.of(
      context,
      NingHaoDemoLocalizations,
    );
  }

  static Map<String, Map<String, String>> _localized = {
    'en': {'title': 'hello'},
    'zh': {'title': '您好'},
  };

  String? get title {
    return _localized[locale.languageCode]!['title'];
  }
}

class NingHaoDemoLocalizationsDelegate
    extends LocalizationsDelegate<NingHaoDemoLocalizations> {
  NingHaoDemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return true;
  }

  @override
  Future<NingHaoDemoLocalizations> load(Locale locale) {
    return SynchronousFuture<NingHaoDemoLocalizations>(
        NingHaoDemoLocalizations(locale));
  }

  @override
  bool shouldReload(
      covariant LocalizationsDelegate<NingHaoDemoLocalizations> old) {
    return false;
  }
}
