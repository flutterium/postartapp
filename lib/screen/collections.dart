import 'package:flutter/material.dart';
import 'package:postart_app/lang/ser_localizations.dart';

class Collections extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          SerLocalizations.of(context)!.collection,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Text(
          SerLocalizations.of(context)!.tempWillBeSeenHere,
          style: TextStyle(color: Colors.white),
        ),
      ),
    ));
  }
}
