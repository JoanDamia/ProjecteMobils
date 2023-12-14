import 'package:flutter/material.dart';
import 'package:jma_app_project/api_routes/treasure_api.dart';
import 'package:jma_app_project/models/treasure.dart';
import 'package:jma_app_project/widgets/treasure_list.dart';

class ShowList extends StatelessWidget {
  const ShowList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiLoadTreasures(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<Treasure>> snapshot,
      ) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final treasureList = snapshot.data!;
        return ListView.builder(
          itemCount: treasureList.length,
          itemBuilder: (BuildContext context, int index) {
            return TreasureList(treasure: treasureList[index]);
          },
        );
      },
    );
  }
}
