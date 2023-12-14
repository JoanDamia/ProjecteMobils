import 'package:flutter/material.dart';
import 'package:jma_app_project/api_routes/monster_api.dart';
import 'package:jma_app_project/models/monster.dart';
import 'package:jma_app_project/widgets/monster_list.dart';

class ShowMonsterList extends StatelessWidget {
  const ShowMonsterList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiLoadMonsters(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<Monster>> snapshot,
      ) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final monsterList = snapshot.data!;
        return ListView.builder(
          itemCount: monsterList.length,
          itemBuilder: (BuildContext context, int index) {
            return MonsterList(monster: monsterList[index]);
          },
        );
      },
    );
  }
}
