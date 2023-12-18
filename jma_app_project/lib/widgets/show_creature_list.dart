import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jma_app_project/api_routes/creatures_api.dart';
import 'package:jma_app_project/models/creature.dart';

class CreatureList extends StatelessWidget {
  const CreatureList({
    super.key,
    required this.creature,
  });

  final Creature creature;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(creature.name),
      subtitle: Text((creature.id).toString()),
      leading: Image(
        image: NetworkImage(creature.image),
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
                            creature.name,
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
                          child: Image(image: NetworkImage(creature.image)),
                        )),
                        Expanded(
                            child: Container(
                          margin: const EdgeInsets.all(10),
                          child: Text(
                            creature.description,
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

class ShowCreatureList extends StatelessWidget {
  const ShowCreatureList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiLoadCreatures(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<Creature>> snapshot,
      ) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final creatureList = snapshot.data!;
        return ListView.builder(
          itemCount: creatureList.length,
          itemBuilder: (BuildContext context, int index) {
            return CreatureList(creature: creatureList[index]);
          },
        );
      },
    );
  }
}
