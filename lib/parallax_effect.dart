import 'package:flutter/material.dart';

// Define the ParallaxEffect widget as a StatefulWidget
class ParallaxEffect extends StatefulWidget {
  const ParallaxEffect({super.key});

  @override
  State<ParallaxEffect> createState() => _ParallaxEffectState();
}

// Define the state for ParallaxEffect
class _ParallaxEffectState extends State<ParallaxEffect> {
  // List of text strings to display on each page
  List<String> texts = [
    'Parallax Scroll',
    'Beauty Of Nature',
    'Power Of Flower',
    'Just Feel Only',
    'Himalayan Look',
  ];

  // ScrollController to track and manage the scroll position
  late ScrollController controller;

  @override
  void initState() {
    controller = ScrollController();
    super.initState();

    // Add a listener to the ScrollController to trigger a rebuild on scroll
    controller.addListener(
      () {
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
   
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        child: ListView.builder(
          // Assign the ScrollController to the ListView
          controller: controller,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              height: size
                  .height,
              clipBehavior: Clip.hardEdge, // Clip the overflowing content
              decoration: const BoxDecoration(), 
              child: Stack(
                children: [
                  // Background image with parallax effect
                  Container(
                    transform: Matrix4.identity()
                      ..translate(
                        0.0,
                        controller.hasClients
                            ? (-(index * size.height) +
                                    controller.position.pixels) /
                                2 // Calculate the vertical translation for parallax effect
                            : 1.0,
                      ),
                    width: size.width,
                    height: size.height,
                    child: Image.asset(
                      'image/image${index + 1}.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                 
                  Center(
                    child: Text(
                      texts[index], // Display the corresponding text
                      style: const TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
