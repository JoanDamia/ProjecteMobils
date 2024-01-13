import 'package:flutter/material.dart';
import 'package:jma_app_project/models/game_element.dart';

class GridElement extends StatelessWidget {
  const GridElement({super.key, required this.gameElement});

  final GameElement gameElement;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Text(
          gameElement.name,
          style: TextStyle(fontSize: screenSize.width / 30,
          fontFamily: 'Zelda'),
        ),
        SizedBox(
          width: screenSize.width / 5,
    
          child: Image(
            image: NetworkImage(gameElement.image),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(screenSize.width / 8 ,screenSize.height / 10),
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(5),
                ),
                onPressed: () {},
                child:  Icon(Icons.add, size: screenSize.width / 30,),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(screenSize.width / 8 ,screenSize.height / 10),
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(5),
                ),
                onPressed: () {},
                child:  Icon(Icons.remove, size: screenSize.width / 30,),
              ),
            ],
          ),
        )
      ],
    );
  }
}
