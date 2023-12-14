import 'package:flutter/material.dart';
import 'package:jma_app_project/api_routes/materials_api.dart';
import 'package:jma_app_project/models/materials.dart';
import 'package:jma_app_project/widgets/materials_list.dart';

class ShowMaterialsList extends StatelessWidget {
  const ShowMaterialsList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiLoadMaterials(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<Materials>> snapshot,
      ) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final materialsList = snapshot.data!;
        return ListView.builder(
          itemCount: materialsList.length,
          itemBuilder: (BuildContext context, int index) {
            return MaterialsList(materials: materialsList[index]);
          },
        );
      },
    );
  }
}