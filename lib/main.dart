import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:postart_app/screen/login.dart';

import 'lang/fallback_cupertino.dart';
import 'lang/ser_localizations_delegate.dart';
import 'lang/supported_locales.dart';
import 'model/selected_index_notifier.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SelectedIndex(),
      child: MaterialApp(
        title: 'postartapp Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        localizationsDelegates: [
          const SerLocalizationsDelegate(),
          const FallbackCupertinoLocalisationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: SupportedLocales.list(),
        locale: Locale('tr'),
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}
