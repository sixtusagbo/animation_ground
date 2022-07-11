import 'package:flutter/material.dart';

class MyImplicitAnimation extends StatefulWidget {
  const MyImplicitAnimation({Key? key}) : super(key: key);

  @override
  State<MyImplicitAnimation> createState() => _MyImplicitAnimationState();
}

class _MyImplicitAnimationState extends State<MyImplicitAnimation> {
  bool _bigger = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MyImplicitAnimation",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green[400],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AnimatedContainer(
            height: 80,
            duration: const Duration(milliseconds: 300),
            decoration: const BoxDecoration(color: Colors.greenAccent),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 50),
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            width: 500,
            curve: Curves.easeInOutQuint,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                  colors: const [Colors.purple, Colors.transparent],
                  stops: [_bigger ? 0.2 : 0.5, 1.0]),
            ),
            child: FlutterLogo(
              size: _bigger ? 300 : 100,
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => setState(() => _bigger = !_bigger),
            style: ElevatedButton.styleFrom(primary: Colors.green),
            child: Icon(_bigger ? Icons.remove : Icons.add),
          ),
        ],
      ),
    );
  }
}
