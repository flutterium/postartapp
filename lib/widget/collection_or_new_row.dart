import 'package:flutter/material.dart';
import 'package:postart_app/lang/ser_localizations.dart';
import 'package:postart_app/screen/collections.dart';
import 'package:postart_app/screen/select_temp_size.dart';

import 'collection_or_new_column.dart';

class CollectionOrNewRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CollectionOrNewColumn(
            icon: Icons.collections,
            text: SerLocalizations.of(context)!.collection,
            navigateTo: Collections(),
          ),
          CollectionOrNewColumn(
            icon: Icons.add,
            text: SerLocalizations.of(context)!.create,
            navigateTo: SelectTempSize(),
          ),
        ],
      ),
    );
  }
}
