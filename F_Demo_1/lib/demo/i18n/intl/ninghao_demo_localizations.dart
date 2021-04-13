import 'package:intl/intl.dart';
import 'ninghao_demo_messages_all.dart';
import 'package:flutter/material.dart';

class NingHaoDemoLocalizations {
  static NingHaoDemoLocalizations of(BuildContext context) {
    return Localizations.of(
      context,
      NingHaoDemoLocalizations,
    );
  }

  static Future<NingHaoDemoLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode!.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return NingHaoDemoLocalizations();
    });
  }

  String get title {
    return Intl.message(
      "hello",
      name: 'title',
      desc: 'demo localizations.',
    );
  }

  String greet(String name) {
    return Intl.message(
      "hello $name",
      name: 'greet',
      desc: 'greet someone.',
      args: [name],
    );
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
    return NingHaoDemoLocalizations.load(locale);
  }

  @override
  bool shouldReload(
      covariant LocalizationsDelegate<NingHaoDemoLocalizations> old) {
    return false;
  }
}
