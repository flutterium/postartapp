import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:postart_app/widget/circle.dart';

class CollectionOrNewColumn extends StatelessWidget {
  final IconData? icon;
  final String? text;
  final Widget? navigateTo;

  const CollectionOrNewColumn({Key? key, this.icon, this.text, this.navigateTo})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => navigateTo!),
            );
          },
          child: Circle(
            icon: icon!,
          ),
        ),
        Text(
          text!,
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
