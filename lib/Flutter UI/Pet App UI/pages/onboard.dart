import 'package:flutter/material.dart';
import '../const.dart';
import '../models/onboards_model.dart';
import 'home.dart';

class PetsOnBoardingScreen extends StatefulWidget {
  const PetsOnBoardingScreen({super.key});

  @override
  State<PetsOnBoardingScreen> createState() => _PetsOnBoardingScreenState();
}

class _PetsOnBoardingScreenState extends State<PetsOnBoardingScreen> {
  int currentPage = 0;
  final PageController _pageController =
      PageController(); // Added PageController

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            color: Colors.white,
            child: PageView.builder(
              controller: _pageController, // Assign PageController here
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemCount: onBoardData.length,
              itemBuilder: (context, index) => OnBoardContent(
                onBoard: onBoardData[index],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (currentPage == onBoardData.length - 1) {
                // If it's the last page, navigate to home
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                  (route) => false,
                );
              } else {
                // Otherwise, go to the next page
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              }
            },
            child: Container(
              height: 70,
              width: MediaQuery.of(context).size.width * 0.6,
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  currentPage == onBoardData.length - 1
                      ? 'Get Started'
                      : 'Continue',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                onBoardData.length,
                (index) => indicator(index: index),
              ),
            ],
          ),
        ],
      ),
    );
  }

  AnimatedContainer indicator({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      width: currentPage == index ? 20 : 10,
      height: 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: currentPage == index ? orange : black.withOpacity(0.2),
      ),
    );
  }
}

class OnBoardContent extends StatelessWidget {
  final OnBoards onBoard;
  const OnBoardContent({super.key, required this.onBoard});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: size.height * 0.4,
          width: size.width * 0.9,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    height: 240,
                    width: size.width * 0.9,
                    color: orangeContainer,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 5,
                          left: -40,
                          height: 130,
                          width: 130,
                          child: Transform.rotate(
                            angle: -11.5,
                            child: Image.network(
                              "https://clipart-library.com/images/rTnrpap6c.png",
                              color: pawColor1,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -20,
                          right: -20,
                          height: 130,
                          width: 130,
                          child: Transform.rotate(
                            angle: 12,
                            child: Image.network(
                              "https://clipart-library.com/images/rTnrpap6c.png",
                              color: pawColor1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 60,
                child: Image.asset(
                  onBoard.image,
                  height: 375,
                  fit: BoxFit.fill,
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 30),
        const Text.rich(
          TextSpan(
            style: TextStyle(
              height: 1.2,
              color: black,
              fontWeight: FontWeight.w900,
              fontSize: 35,
            ),
            children: [
              TextSpan(text: 'Find Your '),
              TextSpan(
                text: 'Dream\n',
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontWeight: FontWeight.w900,
                ),
              ),
              TextSpan(text: 'Pet Here'),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Text(
          onBoard.text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 15.5,
            color: Colors.black38,
          ),
        )
      ],
    );
  }
}
