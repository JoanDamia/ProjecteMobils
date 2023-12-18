import 'package:flutter/material.dart';
import 'package:jma_app_project/api_routes/monster_api.dart';
import 'package:jma_app_project/models/monster.dart';

class MonsterList extends StatelessWidget {
  const MonsterList({
    super.key,
    required this.monster,
  });

  final Monster monster;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(monster.name),
      subtitle: Text((monster.id).toString()),
      leading: Image(
        image: NetworkImage(monster.image),
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
                            monster.name,
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
                          child: Image(image: NetworkImage(monster.image)),
                        )),
                        Expanded(
                            child: Container(
                          margin: const EdgeInsets.all(10),
                          child: Text(
                            monster.description,
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

class ShowMonsterList extends StatelessWidget {
  const ShowMonsterList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiLoadMonsters(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<Monster>> snapshot,
      ) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final monsterList = snapshot.data!;
        return ListView.builder(
          itemCount: monsterList.length,
          itemBuilder: (BuildContext context, int index) {
            return MonsterList(monster: monsterList[index]);
          },
        );
      },
    );
  }
}
