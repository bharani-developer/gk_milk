import 'package:flutter/material.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      // heightFactor: 3,
      // widthFactor: 0.8,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: Colors.white),
        child: Image.asset(
          "assets/images/comingsoon.png",
          height: 500,
        ),
      ),
    );
  }
}
