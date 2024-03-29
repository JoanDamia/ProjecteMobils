import 'package:flutter/material.dart';
import 'package:jma_app_project/api_routes/creatures_api.dart';
import 'package:jma_app_project/api_routes/equipment_api.dart';
import 'package:jma_app_project/api_routes/materials_api.dart';
import 'package:jma_app_project/api_routes/monster_api.dart';
import 'package:jma_app_project/api_routes/treasure_api.dart';
import 'package:jma_app_project/widgets/compendium_widgets/game_element_list.dart';

class ConpendiumTabBar extends StatelessWidget {
  const ConpendiumTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 238, 238, 238),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 36, 28, 26),
          toolbarHeight: screenSize.height / 7,
          bottom: TabBar(
            padding: const EdgeInsetsDirectional.symmetric(vertical: 20),
            indicatorColor: Colors.transparent,
            tabs: [
              Tab(
                child: Container(
                  decoration: BoxDecoration(boxShadow: <BoxShadow>[
                    blueLight(),
                  ]),
                  child: const Image(image: AssetImage('assets/creatures.png')),
                ),
              ),
              Tab(
                child: Container(
                  decoration: BoxDecoration(boxShadow: <BoxShadow>[
                    blueLight(),
                  ]),
                  child: const Image(image: AssetImage('assets/monsters.png')),
                ),
              ),
              Tab(
                child: Container(
                  decoration: BoxDecoration(boxShadow: <BoxShadow>[
                    blueLight(),
                  ]),
                  child: const Image(image: AssetImage('assets/materials.png')),
                ),
              ),
              Tab(
                child: Container(
                  decoration: BoxDecoration(boxShadow: <BoxShadow>[
                    blueLight(),
                  ]),
                  child: const Image(image: AssetImage('assets/equipment.png')),
                ),
              ),
              Tab(
                child: Container(
                  decoration: BoxDecoration(boxShadow: <BoxShadow>[
                    blueLight(),
                  ]),
                  child: const Image(image: AssetImage('assets/treasures.png')),
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            GameElementList(apiLoadElements: apiLoadCreatures),
            GameElementList(apiLoadElements: apiLoadMonsters),
            GameElementList(apiLoadElements: apiLoadMaterials),
            GameElementList(apiLoadElements: apiLoadEquipment),
            GameElementList(apiLoadElements: apiLoadTreasures),
          ],
        ),
      ),
    );
  }

  BoxShadow blueLight() {
    return const BoxShadow(
      blurRadius: 10.0,
      color: Color.fromARGB(193, 45, 195, 255),
    );
  }
}
