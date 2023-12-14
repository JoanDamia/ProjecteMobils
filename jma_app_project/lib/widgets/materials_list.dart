import 'package:jma_app_project/models/materials.dart';
import 'package:flutter/material.dart';

class MaterialsList extends StatelessWidget {
  const MaterialsList({
    super.key,
    required this.materials,
  });

  final Materials materials;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(materials.name),
      subtitle: Text((materials.id).toString()),
      leading: Image(
        image: NetworkImage(materials.image),
      ),
    );
  }
}