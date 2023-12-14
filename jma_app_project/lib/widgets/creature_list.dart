import 'package:jma_app_project/models/creature.dart';
import 'package:flutter/material.dart';

class CreatureList extends StatelessWidget {
  const CreatureList({
    super.key,
    required this.creature,
  });

  final Creature creature;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(creature.name),
      subtitle: Text((creature.id).toString()),
      leading: Image(
        image: NetworkImage(creature.image),
      ),
    );
  }
}