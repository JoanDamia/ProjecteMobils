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
      onTap: () {
        showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: Text(
                            equipment.name,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 22,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 100,
                          ),
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          elevation: 0,
                          backgroundColor: Colors.white,
                          mini: true,
                          child: Icon(Icons.close, color: Colors.grey[700]),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: SizedBox(
                          width: 250,
                          height: 250,
                          child: Image(image: NetworkImage(equipment.image)),
                        )),
                        Expanded(
                            child: Container(
                          margin: const EdgeInsets.all(10),
                          child: Text(
                            equipment.description,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ))
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
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
