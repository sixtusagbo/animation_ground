import 'package:animation_ground/screens/animations/components/beam_transition.dart';
import 'package:flutter/material.dart';

class UfoAnimation extends StatefulWidget {
  const UfoAnimation({Key? key}) : super(key: key);

  @override
  State<UfoAnimation> createState() => _UfoAnimationState();
}

class _UfoAnimationState extends State<UfoAnimation>
    with SingleTickerProviderStateMixin {
  Container starsBackgound = Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/images/star_space.jpg"),
        fit: BoxFit.fill,
      ),
    ),
  );
  final Image ufo = Image.asset("assets/images/ufo.png");
  late final AnimationController _animation;

  @override
  void initState() {
    super.initState();
    _animation = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Explicit Animations 2 - UFO",
        ),
        backgroundColor: Colors.lime,
        centerTitle: true,
      ),
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          starsBackgound,
          BeamTransition(animation: _animation),
          ufo,
        ],
      ),
    );
  }
}
