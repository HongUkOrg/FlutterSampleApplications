
import 'package:flutter/material.dart';

class BlocLocalizations {

  static BlocLocalizations of(BuildContext context) {
    return Localizations.of(
        context,
        BlocLocalizations
    );
  }

  String get appTitle => 'Bleo Todo';
}

class BlocLocalizationsDelegate extends LocalizationsDelegate<BlocLocalizations> {

  @override
  Future<BlocLocalizations> load(Locale locale) =>
    Future(() => BlocLocalizations());

  @override
  bool shouldReload(LocalizationsDelegate<BlocLocalizations> old) => false;

  @override
  bool isSupported(Locale locale) => locale.languageCode.toLowerCase().contains("en");

}