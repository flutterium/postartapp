
import 'dart:async';
 
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../l10n/messages_all.dart';
 
class SerLocalizations {
  static Future<SerLocalizations> load(Locale locale) async {
    final String localeName =
        locale.countryCode == null || locale.countryCode!.isEmpty
            ? locale.languageCode
            : locale.toString();

    final String canonicalLocaleName = Intl.canonicalizedLocale(localeName);

    await initializeMessages(canonicalLocaleName);

    Intl.defaultLocale = canonicalLocaleName;
    return SerLocalizations();
  }

  static SerLocalizations? of(BuildContext context) =>
      Localizations.of<SerLocalizations>(context, SerLocalizations);

  String get yourWebSite => Intl.message('Web siteniz', name: 'yourWebSite',desc: 'Giriş Ekranı');
  String get yourEmail => Intl.message('Mail adresiniz', name: 'yourEmail',desc: 'Giriş Ekranı');
  String get password => Intl.message('Şifreniz', name: 'password',desc: 'Giriş Ekranı');
  String get login => Intl.message('Giriş Yap', name: 'login',desc: 'Giriş Ekranı');
  String get collection => Intl.message('Koleksiyon', name: 'collection',desc: 'Koleksiyon veya Oluştur Ekranı');
  String get create => Intl.message('Oluştur', name: 'create',desc: 'Koleksiyon veya Oluştur Ekranı');
  String get tempWillBeSeenHere => Intl.message('Şablonlarınız burada görüntülenecek.', name: 'tempWillBeSeenHere',desc: 'Koleksiyon Ekranı');
  String get selectTempSize => Intl.message('Şablon ölçüsü seçiniz.', name: 'selectTempSize',desc: 'Oluştur Ekranı');
  String get continueText => Intl.message('Devam et', name: 'continueText',desc: 'Oluştur Ekranı');
  String get newTemp => Intl.message('Yeni şablon', name: 'newTemp',desc: 'Oluştur Ekranı');
  String get image => Intl.message('Resim', name: 'image',desc: 'Oluştur Ekranı');
  String get text => Intl.message('Yazı', name: 'text',desc: 'Oluştur Ekranı');
}