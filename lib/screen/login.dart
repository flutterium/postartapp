import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:postart_app/lang/ser_localizations.dart';
import 'package:postart_app/theme/button_theme.dart';
import 'package:postart_app/widget/postart_app_hero.dart';

import 'collection_or_new.dart';

class LoginPage extends StatefulWidget {
  @override
  _GirisYapState createState() => new _GirisYapState();
}

class _GirisYapState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode? mail;
  FocusNode? pw;
  bool _ilkLoading = true;
  bool _bSifreGoster = false;

  @override
  Widget build(BuildContext context) {
    final btnGiris = Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.2),
        child: ElevatedButton(
            style: raisedButtonStyle,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                CupertinoPageRoute(builder: (context) => CollectionOrNew()),
              );
            },
            child: Text(SerLocalizations.of(context)!.login,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ))));

    var _widFrmGiris = Stack(children: [
      Form(
        key: _formKey,
        child: Center(
          child: Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                padding: EdgeInsets.only(left: 24.0, right: 24.0),
                children: <Widget>[
                  PostartappHero(),
                  SizedBox(height: 48.0),
                  Opacity(
                    opacity: _ilkLoading ? 0.3 : 1,
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.url,
                      autocorrect: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                        hintText: SerLocalizations.of(context)!.yourWebSite,
                        hintStyle:
                            TextStyle(fontSize: 15, color: Colors.grey[400]),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 20),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(mail);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Opacity(
                    opacity: _ilkLoading ? 0.3 : 1,
                    child: TextFormField(
                      focusNode: mail,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                        hintText: SerLocalizations.of(context)!.yourEmail,
                        hintStyle:
                            TextStyle(fontSize: 15, color: Colors.grey[400]),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 20),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(pw);
                      },
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Opacity(
                    opacity: _ilkLoading ? 0.3 : 1,
                    child: TextFormField(
                      focusNode: pw,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                        hintText: SerLocalizations.of(context)!.password,
                        hintStyle:
                            TextStyle(fontSize: 15, color: Colors.grey[400]),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 20),
                        fillColor: Colors.white,
                        filled: true,
                        suffixIcon: TextButton(
                            style: flatButtonStyle,
                            onPressed: () {},
                            child: Icon(Icons.remove_red_eye,
                                color: Color(0xff2871fa))),
                      ),
                      obscureText: !_bSifreGoster,
                    ),
                  ),
                  SizedBox(height: 80.0),
                  btnGiris,
                ],
              ),
            ),
          ),
        ),
      )
    ]);

    return Scaffold(backgroundColor: Colors.grey[900], body: _widFrmGiris);
  }
}
