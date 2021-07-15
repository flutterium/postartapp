import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  final IconData? icon;

  const Circle({Key? key, this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        width: 65,
        height: 65,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(icon),
      ),
    );
  }
}
