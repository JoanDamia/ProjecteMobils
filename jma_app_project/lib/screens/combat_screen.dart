import 'package:flutter/material.dart';
import 'package:jma_app_project/widgets/general_widgets/home_button.dart';
import 'package:jma_app_project/widgets/general_widgets/important_tittle.dart';

class CombatScreen extends StatelessWidget {
  const CombatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: ImportantTittle(
          screenSize: screenSize,
          tittleName: 'COMBAT',
        ),
        centerTitle: true,
        leading: const HomeButton(),
      ),
    );
  }
}
