import 'package:flutter/material.dart';
import 'package:jma_app_project/api_routes/creatures_api.dart';
import 'package:jma_app_project/models/creature.dart';
import 'package:jma_app_project/widgets/compendium_widgets/list_element.dart';

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
            return ListElement(gameElement: creatureList[index]);
          },
        );
      },
    );
  }
}
