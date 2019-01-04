import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'l10n/messages_all.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'es'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}

class AppLocalizations {
  final String locale;
  final DateFormat bonusDateOutputFormat;


  AppLocalizations(String locale)
      : this.locale = locale,
        this.bonusDateOutputFormat = DateFormat('MMMM yyyy', locale);


  static Future<AppLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return AppLocalizations(localeName);
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

//////////////////////////// COMMON STRINGS ////////////////////////////////////
  String get title => Intl.message('Default title', name: 'title', desc: 'common');
  String get count => Intl.message('Default count', name: 'count', desc: 'common');
  String get increment => Intl.message('Default increment', name: 'increment', desc: 'common');
}
