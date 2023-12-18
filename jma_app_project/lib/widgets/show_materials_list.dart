import 'package:flutter/material.dart';
import 'package:jma_app_project/api_routes/materials_api.dart';
import 'package:jma_app_project/models/materials.dart';

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
                            materials.name,
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
                          child: Image(image: NetworkImage(materials.image)),
                        )),
                        Expanded(
                            child: Container(
                          margin: const EdgeInsets.all(10),
                          child: Text(
                            materials.description,
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
