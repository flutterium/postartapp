import 'package:flutter/material.dart';
import 'package:postart_app/lang/ser_localizations.dart';

import 'container_button.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final Function? textOnTap;
  final Function? imgOnTap;

  const CustomBottomNavigationBar({Key? key, this.textOnTap, this.imgOnTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomContainerButton(
              text: SerLocalizations.of(context)!.image, onTap: imgOnTap),
          CustomContainerButton(
              text: SerLocalizations.of(context)!.text, onTap: textOnTap),
        ],
      ),
    );
  }
}
