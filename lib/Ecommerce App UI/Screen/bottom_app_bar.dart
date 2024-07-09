import 'package:flutter/material.dart';
import 'package:flutter_example/Ecommerce%20App%20UI/Screen/ecommerce_home.dart';
import 'package:flutter_example/Ecommerce%20App%20UI/Utils/colors.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

  @override
  State<MyBottomNavBar> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MyBottomNavBar> {
  int selectedIndex = 0;
  late final List<Widget> page;
  @override
  void initState() {
    super.initState();
    page = [
      const MyEcommerceHome(),
      navBarPage(Icons.favorite),
      navBarPage(Icons.person),
      navBarPage(Icons.shopping_cart),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
        child: GNav(
          textStyle:  TextStyle(
            color: primary,
            fontWeight: FontWeight.bold,
          ),
          activeColor:primary,
          tabBackgroundColor: Colors.orange[50]!,
          gap: 6,
          padding: const EdgeInsets.all(12),
          tabs: const [
            GButton(
              icon: Icons.home,
              text: "Home",
              iconSize: 30,
            ),
            GButton(
              icon: Icons.share_location_sharp,
              text: "Location",
              iconSize: 30,
            ),
            GButton(
              icon: Icons.person,
              text: "Profile",
              iconSize: 30,
            ),
            GButton(
              icon: Icons.shopping_cart,
              text: "Cart",
              iconSize: 30,
            )
          ],
          onTabChange: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
      ),
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
