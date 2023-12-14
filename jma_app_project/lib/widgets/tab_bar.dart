import 'package:flutter/material.dart';
import 'package:jma_app_project/widgets/show_monster_list.dart';
import 'package:jma_app_project/widgets/show_treasure_list.dart';

class tab_bar extends StatelessWidget {
  const tab_bar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.apple)),
                Tab(icon: Icon(Icons.catching_pokemon)),
                Tab(icon: Icon(Icons.shield)),
                Tab(icon: Icon(Icons.donut_large)),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              ShowTreasureList(),
              ShowMonsterList(),
              ShowTreasureList(),
              ShowTreasureList(),
            ],
          ),
        ),
      ),
    );
  }
}
