import 'package:flutter/material.dart';
import 'package:postart_app/widget/collection_or_new_row.dart';
import 'package:postart_app/widget/postart_app_hero.dart';

class CollectionOrNew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Padding(
          padding: const EdgeInsets.all(21.0),
          child: Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: SizedBox()),
              Expanded(child: PostartappHero()),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: CollectionOrNewRow(),
              )),
            ],
          )),
        ),
      ),
    );
  }
}
