import 'package:flutter/material.dart';
import 'package:flutter_example/Flutter%20UI/Plant%20Shop%20App%20UI/View/plant_shop_home_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;
  late final List<Widget> page;
  @override
  void initState() {
    page = [
      const PlantShopHomeScreen(),
      navBarPage(Icons.favorite),
      navBarPage(Icons.notifications),
      navBarPage(Icons.person),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 5,
          iconSize: 32,
          currentIndex: selectedIndex,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.black45,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
          ]),
      body: page[selectedIndex],
    );
  }

  navBarPage(iconName) {
    return Center(
      child: Icon(
        iconName,
        size: 100,
        color: Colors.black,
      ),
    );
  }
}
