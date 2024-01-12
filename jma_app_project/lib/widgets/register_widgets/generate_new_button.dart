import 'package:flutter/material.dart';

class GenerateNewButton extends StatelessWidget {
  const GenerateNewButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {

      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0), 
          side: const BorderSide(color: Colors.black, width: 1.0), 
        ),
      ),
      child: const Text('GENERATE NEW',
        style: TextStyle(fontSize: 18.0), 
      ),
    );
  }
}