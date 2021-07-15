import 'package:flutter/material.dart';

class SupportedLocales {

  static List<Locale> list() {
    return [
        const Locale('tr'),
      ];
  }

  static String getLanguageName(Locale locale) {
    switch (locale.toLanguageTag()) {
      case "tr":
        return "Türkçe";
      default:
        return "Türkçe";
    }
  }

}