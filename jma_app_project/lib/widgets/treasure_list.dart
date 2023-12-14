import 'package:jma_app_project/api_routes/treasure.dart';
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
      subtitle: Text((treasure.id).toString()),
      leading: Image(
        image: NetworkImage(treasure.image),
      ),
    );
  }
}

class ShowTreasureList extends StatelessWidget {
  const ShowTreasureList({super.key});

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
