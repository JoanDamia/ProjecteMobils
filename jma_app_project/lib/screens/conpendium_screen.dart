import 'package:flutter/material.dart';
import 'package:jma_app_project/widgets/compendium_widgets/compendium_tab_bar.dart';

class ConpendiumScreen extends StatelessWidget {
  const ConpendiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("COMPENDIUM"),
        centerTitle: true,
        leading: const HomeButton(),
      ),
      body: const ConpendiumTabBar(),
    );
  }
}

class HomeButton extends StatelessWidget {
  const HomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Colors.black,
        ),
      ),
      child: const Icon(
        Icons.home_filled,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.of(context).pushNamed("/");
      },
    );
  }
}
