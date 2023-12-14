import 'package:flutter/material.dart';
import 'package:jma_app_project/widgets/show_creature_list.dart';
import 'package:jma_app_project/widgets/show_equipment_list.dart';
import 'package:jma_app_project/widgets/show_materials_list.dart';
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
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.apple)),
                Tab(icon: Icon(Icons.catching_pokemon)),
                Tab(icon: Icon(Icons.shield)),
                Tab(icon: Icon(Icons.donut_large)),
                Tab(icon: Icon(Icons.access_alarm_outlined)),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              ShowTreasureList(),
              ShowMonsterList(),
              ShowCreatureList(),
              ShowEquipmentList(),
              ShowMaterialsList(),
            ],
          ),
        ),
      ),
    );
  }
}
