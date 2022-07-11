import 'package:animation_ground/screens/animations/my_implicit_animations.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> screens = [
    const MyImplicitAnimation(),
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
