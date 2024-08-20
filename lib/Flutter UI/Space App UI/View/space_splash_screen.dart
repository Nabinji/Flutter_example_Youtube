import 'package:flutter/material.dart';

import 'space_home_screen.dart';

class SpaceSclashScreen extends StatefulWidget {
  const SpaceSclashScreen({super.key});

  @override
  _SpaceSclashScreeState createState() => _SpaceSclashScreeState();
}

class _SpaceSclashScreeState extends State<SpaceSclashScreen> {
  final PageController _pageController = PageController();
  double _progress = 0.33;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            //Planets
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: SizedBox(
                  height: 400,
                  width: 400,
                  child: PageView(
                    controller: _pageController,
                    children: [
                      planetImage("image/image1.png"),
                      planetImage("image/image2.png"),
                      planetImage("image/image3.png"),
                    ],
                  ),
                ),
              ),
            ),
            //Text
            const Text(
              "Explore the \nuniverse!",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 60,
                  color: Colors.white,
                  height: 1.2),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            const Text(
              "Learn more about the \nuniverse where we all live.",
              style: TextStyle(fontSize: 22, color: Colors.white54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            //Button & Progress
            SizedBox(
              width: 130,
              height: 130,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  SizedBox(
                    width: 115,
                    height: 115,
                    child: RotatedBox(
                      quarterTurns: 2,
                      child: CircularProgressIndicator(
                        strokeWidth: 4,
                        color: const Color.fromARGB(255, 103, 117, 247),
                        value: _progress == 0.99 ? 1 : _progress,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _progress += 0.33;
                      });
                      if (_pageController.hasClients) {
                        _pageController.animateToPage(
                            _pageController.page!.toInt() + 1,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut);
                      }
                      if (_pageController.page!.toInt() == 2) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const HomePage(),
                            ),
                            (route) => false);
                      }
                    },
                    child: Container(
                      width: 90,
                      height: 90,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.play_arrow_rounded,
                          size: 40,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox planetImage(image) {
    return SizedBox(
      width: 300,
      height: 300,
      child: Image.asset(
        image,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
