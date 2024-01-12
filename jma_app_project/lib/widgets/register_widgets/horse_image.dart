import 'package:flutter/material.dart';

class HorseImage extends StatelessWidget {
  const HorseImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 1),
      ),
      height: 100,
      width: 100, 
      child: const Center(
        child: Text('IMAGE',
          style: TextStyle(fontSize: 18.0), 
        ),
      ),
    );
  }
}