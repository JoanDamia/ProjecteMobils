import 'package:flutter/material.dart';

class CompendiumLink extends StatelessWidget {
  const CompendiumLink({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 48, 137, 211),
          border: Border(),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: Offset(1.0, 1.0),
              blurRadius: 20.0,
              color: Color.fromARGB(131, 40, 212, 255),
            ),
            BoxShadow(
              offset: Offset(2.0, 2.0),
              color: Color.fromARGB(200, 0, 0, 0),
            ),
          ],
          image: DecorationImage(
              image: AssetImage('assets/blue.jpg'),
              fit: BoxFit.cover,
              opacity: 100)),
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
        width: screenSize.width,
        child: Column(
          children: [
            const Image(
              image: AssetImage('assets/divider_blue.png'),
              opacity: AlwaysStoppedAnimation(100),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Compendium',
                          style: TextStyle(
                              fontFamily: 'Zelda',
                              color: Color.fromARGB(255, 94, 203, 253),
                              fontSize: 30,
                              shadows: <Shadow>[
                                Shadow(
                                  blurRadius: 3.0,
                                  color: Color.fromARGB(158, 45, 195, 255),
                                ),
                              ]),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: const Text(
                            'Little encyclopedia with all the elements of the game',
                            style: TextStyle(
                                color: Color.fromARGB(255, 94, 203, 253),
                                fontSize: 15,
                                shadows: <Shadow>[
                                  Shadow(
                                    blurRadius: 3.0,
                                    color: Color.fromARGB(158, 45, 195, 255),
                                  ),
                                ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: ElevatedButton(
                      child: const Text("Conpendium Screen"),
                      onPressed: () {
                        Navigator.of(context).pushNamed("/ConpendiumScreen");
                      },
                    ),
                  ),
                )
              ],
            ),
            const Image(
              image: AssetImage('assets/divider_blue.png'),
              opacity: AlwaysStoppedAnimation(100),
            ),
          ],
        ),
      ),
    );
  }
}
