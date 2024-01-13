import 'package:flutter/material.dart';
import 'package:jma_app_project/widgets/general_widgets/home_button.dart';
import 'package:jma_app_project/widgets/general_widgets/important_tittle.dart';


class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        shadowColor: const Color.fromARGB(255, 255, 225, 127),
        elevation: 3,
        backgroundColor: Colors.black,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: ImportantTittle(
          screenSize: screenSize,
          tittleName: 'REGISTRATION     ',
        ),
        centerTitle: true,
        leading: const HomeButton(),
      ),
      body:  Stack(
        children: [
          Positioned(
            top: 100,
            left: 20,
         // RegisterButton(gameElement: gameElement)
           child: ElevatedButton(
           onPressed:() {
           },
           child: const Text('Generate Now'),
           ),
          ),
        ],
      ),
    );
  }
}
