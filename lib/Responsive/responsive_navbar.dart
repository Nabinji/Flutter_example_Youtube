import 'package:flutter/material.dart';

class ResponsiveNavbar extends StatefulWidget {
  const ResponsiveNavbar({super.key});

  @override
  _ResponsiveNavbarState createState() => _ResponsiveNavbarState();
}

class _ResponsiveNavbarState extends State<ResponsiveNavbar> {
  double collapsableHeight =
      0.0; // Height of the collapsible menu, initially set to 0.0 (collapsed)

  @override
  Widget build(BuildContext context) {
    double width =
        MediaQuery.of(context).size.width; // Get the width of the screen
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top navbar container
            Container(
              color: Colors.black87,
              height: 80.0,
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Title of the navbar
                  const Text(
                    'WTF Code',
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // If screen width is less than 650.0, show the menu button, else show the navbar items
                  if (width < 650.0)
                    NavBarButton(
                      onPressed: () {
                        // Toggle the height of the collapsible menu
                        setState(() {
                          collapsableHeight =
                              collapsableHeight == 0.0 ? 250.0 : 0.0;
                        });
                      },
                    )
                  else
                    Row(
                      children: navBarItems,
                    ),
                ],
              ),
            ),
            // Collapsible menu container
            AnimatedContainer(
              duration: const Duration(milliseconds: 400), // Animation duration
              height: (width < 650.0)
                  ? collapsableHeight
                  : 0.0, // Height of the collapsible menu based on screen width
              width: double.infinity,
              color: Colors.black87,
              child: SingleChildScrollView(
                child: Column(
                  children:
                      navBarItems, // Display navbar items in the collapsible menu
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
  const NavBarItem(text: 'About'),
  const NavBarItem(text: 'Explore'),
  const NavBarItem(text: 'Connect'),
  const NavBarItem(text: 'Help'),
];

// Color for unselected navbar items
Color unselected = Colors.white60;

class NavBarItem extends StatefulWidget {
  final String text;

  const NavBarItem({
    super.key,
    required this.text,
  });

  @override
  _NavBarItemState createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem> {
  Color color = unselected; // Initial color of the navbar item

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      // Change color on mouse enter
      onEnter: (_) => setState(() => color = Colors.white),
      // Change color back on mouse exit
      onExit: (_) => setState(() => color = unselected),
      child: Container(
        height: 60.0,
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: 18.0,
            color: color, // Set the color of the text
          ),
        ),
      ),
    );
  }
}

class NavBarButton extends StatelessWidget {
  final VoidCallback onPressed;

  const NavBarButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      width: 60.0,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2.0),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: InkWell(
        splashColor: Colors.white60,
        onTap: onPressed, // Callback function when the button is pressed
        child: const Icon(
          Icons.menu,
          size: 30.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
