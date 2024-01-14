import 'package:flutter/material.dart';
import 'package:jma_app_project/models/game_element.dart';
import 'package:jma_app_project/widgets/recipes_widgets/grid_element.dart';

class MaterialsGrid extends StatelessWidget {
  const MaterialsGrid({
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

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemCount: allElementsList.length,
          itemBuilder: (BuildContext context, int index) {
            return GridElement(gameElement: allElementsList[index]);
          },
        );
      },
    );
  }
}
