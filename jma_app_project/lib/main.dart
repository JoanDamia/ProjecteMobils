import 'package:jma_app_project/api.dart';
import 'package:jma_app_project/models/treasure.dart';
import 'package:jma_app_project/widgets/treasure_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder(
          future: apiLoadUsers(),
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
        ),
      ),
    );
  }
}
