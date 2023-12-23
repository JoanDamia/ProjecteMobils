import 'package:flutter/material.dart';

const double backgroundPhotoHeight = 350;

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: backgroundPhotoHeight + 20,
              width: screenSize.width,
              child: const Image(
                image: AssetImage('assets/hyrule_background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: screenSize.width,
            height: backgroundPhotoHeight,
            child: const Expanded(
              child: Column(
                children: [
                  Spacer(),
                  Text(
                    'ZELDA APP',
                    style: TextStyle(
                        fontFamily: 'Zelda',
                        color: Color.fromARGB(255, 199, 162, 95),
                        fontSize: 50,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(1.5, 2.0),
                            blurRadius: 1.0,
                            color: Color.fromARGB(200, 0, 0, 0),
                          ),
                          Shadow(
                            offset: Offset(3.0, 4.0),
                            blurRadius: 5.0,
                            color: Color.fromARGB(130, 0, 0, 0),
                          )
                        ]),
                  ),
                  Text(
                    'Welcome to the Zelda BOTW Application',
                    style: TextStyle(
                        color: Color.fromARGB(255, 199, 162, 95),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(1.0, 1.0),
                            blurRadius: 1.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                          Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 2.0,
                            color: Color.fromARGB(197, 0, 0, 0),
                          )
                        ]),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
          SizedBox(
            width: screenSize.width,
            height: screenSize.height,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: backgroundPhotoHeight,
                    width: screenSize.width,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage('assets/sheikah_background.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            blurRadius: 10.0,
                            color: Color.fromARGB(200, 0, 0, 0),
                          ),
                        ]),
                    height: 1100,
                    width: screenSize.width,
                    child: Column(
                      children: [
                        ElevatedButton(
                          child: const Text("Conpendium Screen"),
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed("/ConpendiumScreen");
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
