import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
       
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 36, 28, 26),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13.0), 
          side: const BorderSide(color: Colors.black, width: 1.0), 
        ),
      ),
      child: const Text('REGISTER',
        style: TextStyle(fontSize: 20.0), 
      ),
    );
  }
}