import 'package:flutter/material.dart';
import 'package:jma_app_project/api_routes/equipment_api.dart';
import 'package:jma_app_project/models/equipment.dart';

class EquipmentList extends StatelessWidget {
  const EquipmentList({
    super.key,
    required this.equipment,
  });

  final Equipment equipment;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(equipment.name),
      subtitle: Text((equipment.id).toString()),
      leading: Image(
        image: NetworkImage(equipment.image),
      ),
    );
  }
}

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
            return EquipmentList(equipment: equipmentList[index]);
          },
        );
      },
    );
  }
}