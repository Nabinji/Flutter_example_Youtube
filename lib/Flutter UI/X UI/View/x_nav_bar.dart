import 'package:flutter/material.dart';
import 'package:flutter_example/Flutter%20UI/X%20UI/View/x_home_page.dart';
import 'package:flutter_example/Flutter%20UI/X%20UI/constants.dart';
import 'package:flutter_svg/svg.dart';

class XBottomNavBar extends StatefulWidget {
  const XBottomNavBar({super.key});

  @override
  State<XBottomNavBar> createState() => _XBottomNavBarState();
}

class _XBottomNavBarState extends State<XBottomNavBar> {
  int selectedIndex = 0;
  late final List<Widget> page;
  @override
  void initState() {
    page = [
      const XHomePage(),
      navBarPage(Icons.search),
      navBarPage(Icons.notifications),
      navBarPage(Icons.grid_view),
      navBarPage(Icons.mail),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kbackgroundColor,
        showSelectedLabels: false,
        currentIndex: selectedIndex,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/twitter-home.svg",
              height: 25,
              width: 25,
              color: Colors.white,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/twitter-search.svg",
              height: 25,
              width: 25,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/twitter-alert-6.svg",
              height: 25,
              width: 25,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/twitter-news.svg",
              height: 25,
              width: 25,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/twitter-message.svg",
              height: 25,
              width: 25,
            ),
            label: "",
          ),
        ],
      ),
      body: page[selectedIndex],
    );
  }

  navBarPage(iconName) {
    return Center(
      child: Icon(
        iconName,
        size: 150,
        color: Colors.white,
      ),
    );
  }
}
