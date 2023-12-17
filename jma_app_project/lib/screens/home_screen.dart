import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         automaticallyImplyLeading: false,
        title: const Text("Home Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Conpendium Screen"),
          onPressed: () {
            Navigator.of(context).pushNamed("/ConpendiumScreen");
          },
        ),
      ),
    );
  }
}
