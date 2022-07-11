import 'dart:math' as math;
import 'package:flutter/material.dart';

class MyTweenAnimation extends StatelessWidget {
  const MyTweenAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "TweenAnimationBuilder",
        ),
        backgroundColor: Colors.amber,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Container(
            height: 80,
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.amberAccent),
          ),
        ),
      ),
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 2 * math.pi),
          duration: const Duration(seconds: 1),
          builder: (_, double angle, __) {
            return Transform.rotate(
              angle: angle,
              child: const FlutterLogo(
                size: 300,
              ),
            );
          },
        ),
      ),
    );
  }
}
