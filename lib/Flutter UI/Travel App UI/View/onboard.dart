import 'package:flutter/material.dart';
import 'package:flutter_example/Flutter%20UI/Travel%20App%20UI/Model/onboard_model.dart';
import 'package:flutter_example/Flutter%20UI/Travel%20App%20UI/Utils/const.dart';

import 'travel_home_screen.dart';

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({super.key});

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  int currentIndex = 0;
  Widget dotIndicator(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      margin: const EdgeInsets.only(right: 10),
      width: index == currentIndex ? 40 : 10,
      height: 10,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: index == currentIndex ? Colors.white : Colors.white54),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            onPageChanged: (value) => setState(() => currentIndex = value),
            itemCount: onboards.length,
            itemBuilder: (context, index) {
              return Image.network(
                onboards[index].image,
                fit: BoxFit.cover,
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: List.generate(onboards.length, dotIndicator),
                ),
                const SizedBox(height: 20),
                Text.rich(
                  TextSpan(
                    style: const TextStyle(
                      fontSize: 45,
                      height: 1.2,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: "${onboards[currentIndex].text1}\n",
                        style: const TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextSpan(
                        text: "${onboards[currentIndex].text2}\n",
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
                if (currentIndex == onboards.length - 1)
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const TravelHomeScreen(),
                          ),
                          (route) => false);
                    },
                    child: AnimatedContainer(
                      padding: const EdgeInsets.all(15),
                      duration: const Duration(milliseconds: 400),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: lightblue,
                      ),
                      child: const Icon(
                        Icons.arrow_forward_ios,
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
