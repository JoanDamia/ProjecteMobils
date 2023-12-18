import 'package:flutter/material.dart';
import 'package:jma_app_project/api_routes/treasure_api.dart';
import 'package:jma_app_project/models/treasure.dart';

class TreasureList extends StatelessWidget {
  const TreasureList({
    super.key,
    required this.treasure,
  });

  final Treasure treasure;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(treasure.name),
      subtitle: Text((treasure.id).toString()),
      leading: Image(
        image: NetworkImage(treasure.image),
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
                            treasure.name,
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
                          child: Image(image: NetworkImage(treasure.image)),
                        )),
                        Expanded(
                            child: Container(
                          margin: const EdgeInsets.all(10),
                          child: Text(
                            treasure.description,
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

class ShowTreasureList extends StatelessWidget {
  const ShowTreasureList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiLoadTreasures(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<Treasure>> snapshot,
      ) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final treasureList = snapshot.data!;
        return ListView.builder(
          itemCount: treasureList.length,
          itemBuilder: (BuildContext context, int index) {
            return TreasureList(treasure: treasureList[index]);
          },
        );
      },
    );
  }
}
