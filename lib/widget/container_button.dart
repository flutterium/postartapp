import 'package:flutter/material.dart';

class CustomContainerButton extends StatelessWidget {
  final String? text;
  final Function? onTap;

  const CustomContainerButton({Key? key, this.text, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          onTap!();
        },
        child: Container(
          height: 30,
          width: 75,
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Center(
            child: Text(
              text!,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
