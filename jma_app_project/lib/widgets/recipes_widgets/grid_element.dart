import 'package:flutter/material.dart';
import 'package:jma_app_project/models/game_element.dart';

class GridElement extends StatelessWidget {
  const GridElement({super.key, required this.gameElement});

  final GameElement gameElement;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
              image: AssetImage('assets/white.jpg'), fit: BoxFit.cover),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              blurRadius: 1.0,
              color: Color.fromARGB(100, 0, 0, 0),
            )
          ]),
      child: Column(
        children: [
          Text(
            gameElement.name,
            style: TextStyle(fontSize: screenSize.width / 30,
            fontFamily: 'Zelda'),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
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
                    backgroundColor: const Color.fromARGB(255, 230, 183, 97),
                    padding: const EdgeInsets.all(5),
                  ),
                  onPressed: () {},
                  child:  Icon(Icons.add,
                    size: screenSize.width / 30,
                    color: Colors.black,),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(screenSize.width / 8 ,screenSize.height / 10),
                    shape: const CircleBorder(),
                    backgroundColor: const Color.fromARGB(255, 230, 183, 97),
                    padding: const EdgeInsets.all(5),
                  ),
                  onPressed: () {},
                  child:  Icon(Icons.remove, 
                    size: screenSize.width / 30,
                    color: Colors.black,
                    ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
