import 'package:animation_ground/screens/animations/components/galaxy_web.dart';
import 'package:animation_ground/screens/animations/components/time_stopper.dart';
import 'package:flutter/material.dart';

class MyExplicitAnimation extends StatefulWidget {
  const MyExplicitAnimation({Key? key}) : super(key: key);

  @override
  State<MyExplicitAnimation> createState() => _MyExplicitAnimationState();
}

class _MyExplicitAnimationState extends State<MyExplicitAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 15),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Explicit Animations",
        ),
        backgroundColor: Colors.purpleAccent,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: TimeStopper(controller: _animationController),
          ),
          Align(
            alignment: Alignment.center,
            child: RotationTransition(
              alignment: Alignment.center,
              turns: _animationController,
              child: const GalaxyWeb(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
