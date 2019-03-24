import 'package:flutter/material.dart';
import 'dart:async';
import '../models/item_model.dart';

class Comments extends StatelessWidget {
  final int itemId;
  final Map<int, Future<ItemModel>> itemMap;

  Comments({this.itemId, this.itemMap});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: itemMap[itemId],
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Text('ロード中');
        }

        final children = <Widget>[
          Text(snapshot.data.text),
        ];
        snapshot.data.kids.forEach((kidId) {
          children.add(
            Comments(itemId: kidId, itemMap: itemMap)
          );
        });

        return Column(
          children: children,
        );
      },
    );
  }

}