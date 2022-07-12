import 'package:flutter/material.dart';

class MyTweenAnimation extends StatefulWidget {
  const MyTweenAnimation({Key? key}) : super(key: key);

  @override
  State<MyTweenAnimation> createState() => _MyTweenAnimationState();
}

class _MyTweenAnimationState extends State<MyTweenAnimation> {
  double _sliderValue = 0;
  Color? _newColor = Colors.white;
  Container starsBackgound = Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/images/star_space.jpg"),
        fit: BoxFit.fill,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "TweenAnimationBuilder",
        ),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          starsBackgound,
          Column(
            children: [
              Center(
                child: TweenAnimationBuilder(
                  tween: ColorTween(begin: Colors.white, end: _newColor),
                  duration: const Duration(seconds: 2),
                  builder: (_, Color? color, Widget? myChild) {
                    return ColorFiltered(
                      colorFilter: ColorFilter.mode(color!, BlendMode.modulate),
                      child: myChild,
                    );
                  },
                  //- Very important as it makes flutter rebuild only the
                  //- new color feature from frame to frame not the image itself
                  child: Image.asset("assets/images/sun.png"),
                ),
              ),
              Slider.adaptive(
                value: _sliderValue,
                onChanged: (double value) => setState(() {
                  _sliderValue = value;
                  _newColor =
                      Color.lerp(Colors.white, Colors.red, _sliderValue);
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
