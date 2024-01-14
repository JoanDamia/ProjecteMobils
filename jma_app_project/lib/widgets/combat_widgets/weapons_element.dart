import 'package:flutter/material.dart';
import 'package:jma_app_project/models/game_element.dart';

class WeaponsElement extends StatelessWidget {
  const WeaponsElement({super.key, required this.gameElement});

  final GameElement gameElement;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          width: screenSize.width / 5,
    
          child: Image(
            image: NetworkImage(gameElement.image),
          ),
        ),
        Text(
          gameElement.name,
          style: TextStyle(fontSize: screenSize.width / 30,
          fontFamily: 'Zelda'),
        ),
        Text(
          gameElement.name,
          style: TextStyle(fontSize: screenSize.width / 30,
          fontFamily: 'Zelda'),
        ),
      ],
    );
  }
}

