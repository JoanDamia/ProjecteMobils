import 'package:flutter/material.dart';
import 'package:jma_app_project/models/game_element.dart';

class DetailsDialog extends StatelessWidget {
  const DetailsDialog({
    super.key,
    required this.gameElement,
  });

  final GameElement gameElement;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Text(
                    gameElement.name,
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
                  child: Image(image: NetworkImage(gameElement.image)),
                )),
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.all(10),
                  child: Text(
                    gameElement.description,
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
  }
}
