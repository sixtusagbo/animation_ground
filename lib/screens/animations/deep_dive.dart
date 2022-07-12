import 'package:flutter/material.dart';

class DeepDive extends StatefulWidget {
  const DeepDive({Key? key}) : super(key: key);

  @override
  State<DeepDive> createState() => _DeepDiveState();
}

class _DeepDiveState extends State<DeepDive>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  int i = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _controller.addListener(_update);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _update() {
    setState(() {
      i = (_controller.value * 299792458).round();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Under the Hood",
        ),
        backgroundColor: Colors.teal[50],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 40),
        child: Text(
          "$i m/s",
          style: const TextStyle(
            color: Colors.teal,
            fontWeight: FontWeight.bold,
            fontSize: 36,
          ),
        ),
      ),
    );
  }
}
