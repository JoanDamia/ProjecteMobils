import 'package:jma_app_project/models/monster.dart';
import 'package:flutter/material.dart';

class MonsterList extends StatelessWidget {
  const MonsterList({
    super.key,
    required this.monster,
  });

  final Monster monster;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(monster.name),
      subtitle: Text((monster.id).toString()),
      leading: Image(
        image: NetworkImage(monster.image),
      ),
    );
  }
}
