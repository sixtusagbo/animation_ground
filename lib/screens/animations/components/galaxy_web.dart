import 'package:flutter/material.dart';

class GalaxyWeb extends StatelessWidget {
  const GalaxyWeb({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/gemini.png",
      fit: BoxFit.cover,
    );
  }
}
