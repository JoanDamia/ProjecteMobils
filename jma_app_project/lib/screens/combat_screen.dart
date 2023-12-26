import 'package:flutter/material.dart';

class CombatScreen extends StatelessWidget {
  const CombatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("COMBAT"),
        centerTitle: true,
        leading: const HomeButton(),
      ),
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
