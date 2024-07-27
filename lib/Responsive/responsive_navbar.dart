import 'package:flutter/material.dart';

class ResponsiveNavbar extends StatefulWidget {
  const ResponsiveNavbar({super.key});

  @override
  State<ResponsiveNavbar> createState() => _ResponsiveNavbarState();
}

class _ResponsiveNavbarState extends State<ResponsiveNavbar> {
  // Height of the collapsible menu, initially set to 0
  double collapsAbleHeight = 0.0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Navbar container
            Container(
              color: Colors.black87,
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // title of the navbar
                  const Text(
                    "WTF Code",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // If screen width is less than 650 show the menu button (mobile view), else show the navbar items (web view),
                  if (width < 650)
                    NavBarMenuButton(
                      onPressed: () {
                        // Toggle the height of the collapsible menu
                        setState(() {
                          collapsAbleHeight = collapsAbleHeight == 0 ? 250 : 0;
                        });
                      },
                    )
                  else
                    Row(
                      children: navBarItems,
                    )
                ],
              ),
            ),
            // collapsible menu container
            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              // height of the collapsible menu based on screen wiedth
              height: (width < 650) ? collapsAbleHeight : 0,
              width: double.infinity,
              color: Colors.black87,
              child: SingleChildScrollView(
                child: Column(
                  children: navBarItems,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// List of navbar items
List<Widget> navBarItems = [
  const NavBarItems(title: "About"),
  const NavBarItems(title: "Connect"),
  const NavBarItems(title: "Explore"),
  const NavBarItems(title: "Help"),
];

Color unSelectedColor = Colors.white60;

class NavBarItems extends StatefulWidget {
  final String title;
  const NavBarItems({super.key, required this.title});

  @override
  State<NavBarItems> createState() => _NavBarItemsState();
}

class _NavBarItemsState extends State<NavBarItems> {
  Color color = unSelectedColor;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      // change color on mouse enter
      onEnter: (event) => setState(() {
        color = Colors.white;
      }),
      // change color back on mouse exit
      onExit: (event) => setState(() {
        color = unSelectedColor;
      }),
      child: Container(
        height: 60,
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child: Text(
          widget.title,
          style: TextStyle(
            fontSize: 18,
            color: color, // set the color of the text
          ),
        ),
      ),
    );
  }
}

class NavBarMenuButton extends StatelessWidget {
  final VoidCallback onPressed;
  const NavBarMenuButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        splashColor: Colors.white60,
        onTap: onPressed, // Callback function when the button is pressed
        child: const Icon(
          Icons.menu,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}
