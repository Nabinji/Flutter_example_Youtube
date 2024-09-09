import 'package:flutter/material.dart';

import '../consts.dart';
import '../models/onboard_model.dart';
import '../widgets/fade_in_animation.dart';
import 'main_page.dart';

class AppOnBoardPage extends StatefulWidget {
  const AppOnBoardPage({super.key});

  @override
  State<AppOnBoardPage> createState() => _AppOnBoardPageState();
}

class _AppOnBoardPageState extends State<AppOnBoardPage> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          PageView.builder(
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            itemCount: onboards.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  FadeInAnimation(
                    durationInMs: 250,
                    animationPosition: AnimationPosition(
                      topAfter: -100,
                      topBefore: -200,
                      leftAfter: -150,
                      leftBefore: -150,
                    ),
                    child: Image.asset(
                      onboards[index].image,
                      width: 600,
                      height: 600,
                      fit: BoxFit.contain,
                    ),
                  ),
                  FadeInAnimation(
                    durationInMs: 250,
                    animationPosition: AnimationPosition(
                      topAfter: 450,
                      topBefore: 500,
                      leftAfter: 25,
                      leftBefore: 25,
                    ),
                    child: Text(
                      onboards[index].text1,
                      style: const TextStyle(
                        color: white,
                        fontSize: 48,
                        height: 1.3,
                      ),
                    ),
                  ),
                  FadeInAnimation(
                    durationInMs: 250,
                    animationPosition: AnimationPosition(
                      topAfter: 610,
                      topBefore: 660,
                      leftAfter: 25,
                      leftBefore: 25,
                    ),
                    child: Text(
                      onboards[index].text2,
                      style: const TextStyle(color: white, fontSize: 24),
                    ),
                  ),
                ],
              );
            },
          ),
          FadeInAnimation(
              durationInMs: 250,
              animationPosition: AnimationPosition(
                topAfter: 680,
                topBefore: 800,
                leftAfter: 25,
                leftBefore: 25,
              ),
              child: Row(
                children: [
                  ...List.generate(
                    onboards.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      height: 5,
                      width: 50,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: currentPage == index
                            ? white
                            : white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ],
              )),
          FadeInAnimation(
            durationInMs: 250,
            animationPosition: AnimationPosition(
              bottomAfter: 30,
              bottomBefore: -50,
            ),
            child: MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainPage(),
                  ),
                );
              },
              color: orange,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              height: 72,
              minWidth: MediaQuery.of(context).size.width - 50,
              child: const Center(
                child: Text(
                  'Get Started',
                  style: TextStyle(color: white, fontSize: 24),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
