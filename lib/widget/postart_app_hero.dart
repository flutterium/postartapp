import 'package:flutter/material.dart';

class PostartappHero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'postartapp',
      child: Text(
        'postartapp',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 45, color: Colors.white),
      ),
    );
  }
}
