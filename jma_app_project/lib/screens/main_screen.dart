import 'package:flutter/material.dart';
import 'package:jma_app_project/widgets/treasure_list.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Main Screen")),
      body: const ShowTreasureList(),
    );
  }
}
