import 'package:animation_ground/screens/animations/components/beam_clipper.dart';
import 'package:flutter/material.dart';

class BeamTransition extends AnimatedWidget {
  const BeamTransition({
    Key? key,
    required Animation<double> animation,
    Widget? child,
  })  : _child = child,
        super(key: key, listenable: animation);

  final Widget? _child;

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = listenable as Animation<double>;

    return ClipPath(
      clipper: const BeamClipper(),
      child: Container(
        height: 1000,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            radius: 1.5,
            colors: const [Colors.yellow, Colors.transparent],
            stops: [0, animation.value],
          ),
        ),
      ),
    );
  }
}
