import 'package:flutter/material.dart';

class ArrowDivider extends StatelessWidget {
  const ArrowDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 25),
            width: screenSize.width / 2,
            height: 3,
            color: const Color.fromARGB(255, 172, 147, 94)),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 10, 0, 25),
          height: 5,
          child: Transform.flip(
            flipX: true,
            child: const Image(
              image: AssetImage('assets/arrow_decoration_tip.png'),
              fit: BoxFit.fitWidth,
            ),
          ),
        )
      ],
    );
  }
}
