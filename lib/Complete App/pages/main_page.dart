import 'package:flutter/material.dart';
import 'package:flutter_example/Complete%20App/pages/home_page.dart';

import '../consts.dart';
import '../models/bottom_icon_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    Widget body() {
      switch (currentPage) {
        case 0:
          return const AppHomeScreen();
        case 1:
          return const Center(
            child: Text(
              'Message Page',
              style: TextStyle(color: black, fontSize: 28),
            ),
          );
        case 2:
          return const Center(
            child: Text(
              'Explore Page',
              style: TextStyle(color: black, fontSize: 28),
            ),
          );
        case 3:
          return const Center(
            child: Text(
              'Profile Page',
              style: TextStyle(color: black, fontSize: 28),
            ),
          );
        default:
          return const Center(
            child: Text(
              'Something Wrong !!',
              style: TextStyle(color: black, fontSize: 28),
            ),
          );
      }
    }

    return Scaffold(
      backgroundColor: bgColor,
      body: body(),
      bottomNavigationBar: Container(
        height: 86,
        color: white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...List.generate(
              bottomIcons.length,
              (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    currentPage = index;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      currentPage == index
                          ? bottomIcons[index].selected
                          : bottomIcons[index].unselected,
                      color: black,
                    ),
                    const SizedBox(height: 10),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      decoration: const BoxDecoration(
                        color: black,
                        shape: BoxShape.circle,
                      ),
                      width: currentPage == index ? 7 : 0,
                      height: currentPage == index ? 7 : 0,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
