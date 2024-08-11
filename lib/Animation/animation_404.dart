import 'package:flutter/material.dart';

class Flutter404Animation extends StatefulWidget {
  const Flutter404Animation({super.key});

  @override
  _Flutter404AnimationState createState() => _Flutter404AnimationState();
}

class _Flutter404AnimationState extends State<Flutter404Animation>
    with SingleTickerProviderStateMixin {
  // AnimationController will control the animation.
  late AnimationController _controller;

  @override
  void initState() {
    // Initialize the AnimationController with a duration of 2 seconds for both
    // forward and reverse animations.
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      reverseDuration: const Duration(seconds: 2),
      vsync: this,
    )
      // Add a listener to check the status of the animation.
      // If the animation is completed, it reverses back.
      // If it is dismissed (reached the beginning), it forwards again.
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });

    // Start the animation in the forward direction.
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          // The first positioned widget displays an animated image that rotates back and forth.
          Positioned(
            bottom: height / 4.4,
            right: height / 20,
            child: AnimatedBuilder(
                // The AnimatedBuilder listens to changes in the AnimationController and rebuilds
                // the widget tree with each tick of the animation.
                animation: _controller,
                child: Image.asset(
                  'image/light.png',
                  height: height * 1.3,
                ),
                builder: (BuildContext context, widget) {
                  // The Transform widget is used to rotate the image around its bottom-center point.
                  return Transform.rotate(
                    angle: -_controller
                        .value, // Rotate the image according to the animation value.
                    alignment: Alignment.bottomCenter,
                    child: widget,
                  );
                }),
          ),

          Positioned(
            bottom: 0,
            right: height / 2.7,
            child: Image.asset(
              'image/source.png',
              width: height / 4.6,
            ),
          ),

          Center(
            child: Column(
              children: [
                Text(
                  '404',
                  style: TextStyle(
                    fontSize: height /
                        5, // Set the font size relative to the screen height.
                    fontWeight: FontWeight.bold, // Make the text bold.
                    color: Theme.of(context)
                        .primaryColor, // Use the theme's primary color.
                  ),
                ),
                Text(
                  'Page Not Found',
                  style: TextStyle(
                    fontSize: height *
                        0.05, // Set the font size relative to the screen height.
                    fontWeight: FontWeight.bold, // Make the text bold.
                    color: Theme.of(context)
                        .primaryColor, // Use the theme's primary color.
                  ),
                  textAlign: TextAlign.center, // Center the text horizontally.
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
