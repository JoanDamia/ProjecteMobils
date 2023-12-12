import 'package:jma_app_project/models/treasure.dart';
import 'package:flutter/material.dart';

class TreasureList extends StatelessWidget {
  const TreasureList({
    super.key,
    required this.treasure,
  });

  final Treasure treasure;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(treasure.name),
      subtitle: Text(treasure.id as String),
      leading: Image(
        image: NetworkImage(treasure.image),
      ),
    );
  }
}
