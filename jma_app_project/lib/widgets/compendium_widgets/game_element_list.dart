import 'package:flutter/material.dart';
import 'package:jma_app_project/models/game_element.dart';
import 'package:jma_app_project/widgets/compendium_widgets/list_element.dart';

class GameElementList extends StatelessWidget {
  const GameElementList({
    super.key,
    required this.apiLoadElements,
  });

  final Future<List<GameElement>> Function() apiLoadElements;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiLoadElements(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<GameElement>> snapshot,
      ) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final allElementsList = snapshot.data!;

        // TODO: Filtrar aquí

        return ListView.builder(
          itemCount: allElementsList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListElement(gameElement: allElementsList[index]);
          },
        );
      },
    );
  }
}
