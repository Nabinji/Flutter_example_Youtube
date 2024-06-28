import 'package:flutter/material.dart';

class ParallaxEffect extends StatefulWidget {
  const ParallaxEffect({super.key});

  @override
  State<ParallaxEffect> createState() => _ParallaxEffectState();
}

class _ParallaxEffectState extends State<ParallaxEffect> {
  // List of text string to display on each page
  List<String> texts = [
    'Parallax Effect',
    'Beauty of Nature',
    'Power of Flower',
    ' Just Feel It',
    'Himalayan Look',
  ];

  // ScrollController to track and manage the scroll position
  late ScrollController scrollController;
  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
    // add a listener to the ScrollController to trigger a rebuild on scroll
    scrollController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView.builder(
        // Assign the ScrollController to the listView

        controller: scrollController,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            height: size.height,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(),
            child: Stack(
              children: [
                // Background image with parallax effect
                Container(
                  transform: Matrix4.identity()
                    ..translate(
                        0.0,
                        scrollController.hasClients
                            ? (-(index * size.height) +
                                    scrollController.position.pixels) /
                                2
                            : 1.0), // Calculate the vertical translation for parallax effect
                  width: size.width,
                  height: size.height,
                  child: Image.asset(
                    'image/image${index + 1}.png',
                    fit: BoxFit.cover,
                  ), // my image name is image1,image2,image3... image5, that's why
                  // i give image${index + 1}.png' you can give the same name what i have give or manage it accordingly with your image name
                ),
                Center(
                  child: Text(
                    texts[index],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
