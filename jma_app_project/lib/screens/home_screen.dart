import 'package:flutter/material.dart';
import 'package:jma_app_project/widgets/home_widgets/app_intro_section.dart';
import 'package:jma_app_project/widgets/home_widgets/arrow_divider.dart';

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
          AppIntroSection(screenSize: screenSize),
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
                    padding: const EdgeInsets.all(30),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage('assets/black.jpg'),
                            repeat: ImageRepeat.repeat),
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
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Original Screens',
                                style: TextStyle(
                                  fontFamily: 'MedulaOne',
                                  color: Colors.white,
                                  fontSize: 40,
                                ),
                              ),
                              ArrowDivider()
                            ],
                          ),
                        ),
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
