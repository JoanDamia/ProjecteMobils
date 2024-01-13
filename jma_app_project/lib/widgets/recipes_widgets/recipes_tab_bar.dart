import 'package:flutter/material.dart';
import 'package:jma_app_project/api_routes/materials_api.dart';
import 'package:jma_app_project/widgets/recipes_widgets/materials_grid.dart';
import 'package:jma_app_project/widgets/recipes_widgets/tab_button.dart';

class RecipesTabBar extends StatelessWidget {
  const RecipesTabBar({super.key});

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2, 
      child:Scaffold(
        appBar: AppBar(
          bottom: const TabBar(tabs:[
            Tab(child: TabButton(recipesButtonText: "Ingredients",)),
            Tab(child: TabButton(recipesButtonText: "Crafted",)),
          
          ],
           ),
        ),
        body:  const TabBarView(children:[
          MaterialsGrid(apiLoadElements: apiLoadMaterials),
          TabButton(recipesButtonText: "Crafted Recipes",),
          ],
        ) 
      ),
      );
  }
}