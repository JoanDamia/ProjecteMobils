import 'package:flutter/material.dart';
import 'package:jma_app_project/api_routes/creatures_api.dart';
import 'package:jma_app_project/models/creature.dart';

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

class ShowCreatureList extends StatelessWidget {
  const ShowCreatureList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiLoadCreatures(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<Creature>> snapshot,
      ) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final creatureList = snapshot.data!;
        return ListView.builder(
          itemCount: creatureList.length,
          itemBuilder: (BuildContext context, int index) {
            return CreatureList(creature: creatureList[index]);
          },
        );
      },
    );
  }
}