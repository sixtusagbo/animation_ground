import 'package:animation_ground/screens/animations/deep_dive.dart';
import 'package:animation_ground/screens/animations/my_explicit_animations.dart';
import 'package:animation_ground/screens/animations/my_implicit_animations.dart';
import 'package:animation_ground/screens/animations/my_tween_animation.dart';
import 'package:animation_ground/screens/animations/ufo_animation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> screens = [
    const MyImplicitAnimation(),
    const MyTweenAnimation(),
    const MyExplicitAnimation(),
    const UfoAnimation(),
    const DeepDive(),
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: screens.length,
      itemBuilder: (context, index) => screens[index],
      onPageChanged: (value) => setState(() => currentPage = value),
    );
  }
}
