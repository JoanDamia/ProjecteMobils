import 'package:flutter/material.dart';
import 'package:jma_app_project/api_routes/all_elements_api.dart';
import 'package:jma_app_project/models/game_element.dart';
import 'package:jma_app_project/widgets/compendium_widgets/list_element.dart';

class ShowAllElementsList extends StatelessWidget {
  const ShowAllElementsList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiLoadAll(),
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
