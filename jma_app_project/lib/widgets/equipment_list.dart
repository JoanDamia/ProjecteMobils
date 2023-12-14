import 'package:jma_app_project/models/equipment.dart';
import 'package:flutter/material.dart';

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