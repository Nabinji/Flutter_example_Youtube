import 'package:flutter/material.dart';

import '../Utils/const.dart';
import 'travel_home.dart';
import '../Model/onboard_model.dart';

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({super.key});

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  int currentPage = 0;

  Widget buildIndicator(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      margin: const EdgeInsets.only(right: 10),
      width: index == currentPage ? 40 : 10,
      height: 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: index == currentPage ? Colors.white : Colors.white54,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            itemCount: onboards.length,
            onPageChanged: (value) => setState(() => currentPage = value),
            itemBuilder: (context, index) => Image.network(
              onboards[index].image,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: List.generate(onboards.length, buildIndicator),
                ),
                const SizedBox(height: 20),
                Text.rich(
                  TextSpan(
                    style: const TextStyle(
                      fontSize: 45,
                      color: Colors.white,
                      height: 1.2,
                    ),
                    children: [
                      TextSpan(
                        text: '${onboards[currentPage].text1}\n',
                        style: const TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextSpan(
                        text: onboards[currentPage].text2,
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                if (currentPage == onboards.length - 1)
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TravelHomePage(),
                        ),
                        (route) => false,
                      );
                    },
                    child: AnimatedContainer(
                      padding: const EdgeInsets.all(15),
                      duration: const Duration(milliseconds: 500),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: lightblue,
                      ),
                      child: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
