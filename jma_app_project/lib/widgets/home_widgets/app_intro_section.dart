import 'package:flutter/material.dart';
import 'package:jma_app_project/screens/home_screen.dart';

class AppIntroSection extends StatelessWidget {
  const AppIntroSection({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
