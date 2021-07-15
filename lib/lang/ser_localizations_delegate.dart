import 'dart:async';
import 'package:flutter/material.dart';
import 'ser_localizations.dart';
 
class SerLocalizationsDelegate extends LocalizationsDelegate<SerLocalizations> {
  const SerLocalizationsDelegate();
 
  @override
  bool isSupported(Locale locale) => ['tr'].contains(locale.languageCode);

  @override
  Future<SerLocalizations> load(Locale locale) => SerLocalizations.load(locale);

  @override
  bool shouldReload(LocalizationsDelegate<SerLocalizations> old) => false;
}