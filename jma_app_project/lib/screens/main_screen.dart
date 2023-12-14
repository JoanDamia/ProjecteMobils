import 'package:flutter/material.dart';
import 'package:jma_app_project/widgets/show_list.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.apple)),
                Tab(icon: Icon(Icons.catching_pokemon)),
                Tab(icon: Icon(Icons.shield)),
                Tab(icon: Icon(Icons.donut_large)),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              ShowList(),
              ShowList(),
              ShowList(),
              ShowList(),
            ],
          ),
        ),
      ),
    );
  }
}
