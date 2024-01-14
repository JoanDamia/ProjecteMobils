import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  const TabButton({super.key,required this.recipesButtonText});

final String recipesButtonText;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
            width: screenSize.width / 4.5,
            height: screenSize.width / 15,
            margin: const EdgeInsets.symmetric(horizontal: 20),
           decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
              image: AssetImage('assets/blue.jpg'), fit: BoxFit.cover),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              blurRadius: 1.0,
              color: Color.fromARGB(100, 0, 0, 0),
            )
          ]),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      recipesButtonText,
                      style: TextStyle(
                        fontFamily: 'Zelda',
                        fontSize: screenSize.width / 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                
              ],
            ),
          );
  }
}