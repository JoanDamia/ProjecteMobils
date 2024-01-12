import 'package:flutter/material.dart';
import 'package:jma_app_project/screens/registration_screen.dart';

class Stats extends StatelessWidget {
  const Stats({
    super.key,
    required this.selectedStats,
    required this.i,
    required this.j,
  });

  final List<int> selectedStats;
  final int i;
  final int j;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      width: 35,
      height: 35,
      child: ClipPath(
        clipper: TriangleClipper(),
        child: Container(
          color: selectedStats[i] == j
              ? Colors.green
              : Colors.grey,
        ),
      ),
    );
  }
}