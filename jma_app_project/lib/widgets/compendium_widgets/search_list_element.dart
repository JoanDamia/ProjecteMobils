import 'package:flutter/material.dart';
import 'package:jma_app_project/api_routes/all_elements_api.dart';
import 'package:jma_app_project/models/game_element.dart';
import 'package:jma_app_project/widgets/compendium_widgets/list_element.dart';

class SearchListElement extends StatefulWidget {
  const SearchListElement({Key? key}) : super(key: key);

  @override
  State<SearchListElement> createState() => _SearchListElementState();
}

class _SearchListElementState extends State<SearchListElement> {
  TextEditingController controller = TextEditingController();
  String results = '';

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50,
                  width: 300,
                  child: TextField(
                    controller: controller,
                    onChanged: (text) {
                      text = results;
                      debugPrint("text = '$results}'");
                    },
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  controller.text = '';
                },
              )
            ],
          ),
        ),
        Expanded(
          child: FutureBuilder(
            future: apiLoadAll(),
            builder: (
              BuildContext context,
              AsyncSnapshot<List<GameElement>> snapshot,
            ) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              final allElementsList = snapshot.data!;
              return ListView.builder(
                itemCount: results.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListElement(gameElement: allElementsList[index]);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
