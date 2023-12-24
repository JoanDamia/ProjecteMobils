import 'package:flutter/material.dart';
import 'package:jma_app_project/models/game_element.dart';
import 'package:jma_app_project/widgets/compendium_widgets/details_dialog.dart';

class ListElement extends StatelessWidget {
  const ListElement({
    super.key,
    required this.gameElement,
  });

  final GameElement gameElement;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(gameElement.name),
      subtitle: Text((gameElement.id).toString()),
      leading: Image(
        image: NetworkImage(gameElement.image),
      ),
      onTap: () {
        showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return DetailsDialog(gameElement: gameElement);
          },
        );
      },
    );
  }
}
