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
                image: NetworkImage(
                    'https://raw.githubusercontent.com/gadhagod/hyrule-compendium-demo/main/images/hyrule-compendium-meta.png'),
                fit: BoxFit.cover,
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
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
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
