import 'package:flutter/material.dart';
import 'package:jma_app_project/api_routes/equipment_api.dart';
import 'package:jma_app_project/models/equipment.dart';
import 'package:jma_app_project/widgets/list_element.dart';

class ShowEquipmentList extends StatelessWidget {
  const ShowEquipmentList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiLoadEquipment(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<Equipment>> snapshot,
      ) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final equipmentList = snapshot.data!;
        return ListView.builder(
          itemCount: equipmentList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListElement(gameElement: equipmentList[index]);
          },
        );
      },
    );
  }
}
