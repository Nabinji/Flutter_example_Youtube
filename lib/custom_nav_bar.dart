import 'package:flutter/material.dart';

// Main widget for the custom dropdown with hover effect
class CustomDropDownWithHoverEffect extends StatefulWidget {
  const CustomDropDownWithHoverEffect({super.key});

  @override
  _CustomDropDownWithHoverEffectState createState() =>
      _CustomDropDownWithHoverEffectState();
}

class _CustomDropDownWithHoverEffectState
    extends State<CustomDropDownWithHoverEffect> {
  // Declare variables for animation
  double height = 150;
  double bottomheight = 140;
  double width = 400;
  double turns = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: height,
          width: width,
          child: Stack(
            children: [
              // Container that holds the list of items
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: bottomheight,
                width: 390,
                child: const SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(height: 160),
                      ForHover(text: 'Youtube'), // Hoverable item
                      ForHover(text: 'Twitter'), // Hoverable item
                      ForHover(text: 'LinkedIn'), // Hoverable item
                      ForHover(text: 'Facebook'), // Hoverable item
                      ForHover(text: 'GitHub'), // Hoverable item
                    ],
                  ),
                ),
              ),
              // Container that holds the main profile section
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 140,
                width: 390,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 217, 202, 179),
                ),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        // Profile picture
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://media.licdn.com/dms/image/D4E03AQFUcpGFAGfQnA/profile-displayphoto-shrink_200_200/0/1680274769856?e=2147483647&v=beta&t=kSMPiQ4PHJ2BuepGMpaQGvq8Vo_2GDaoPi8X3-YOz2A"),
                          radius: 40.0,
                        ),
                        // Profile name and designation
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Nabin Paudyal",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Developer",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Button to expand/collapse the list
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  borderRadius: BorderRadius.circular(25.0),
                  onTap: () {
                    // Toggle the state to expand/collapse the list
                    setState(() {
                      height = height == 150 ? 400 : 150;
                      turns = turns == 0.5 ? 1 : 0.5;
                      bottomheight = bottomheight == 140 ? 400 : 140;
                    });
                  },
                  child: AnimatedRotation(
                    turns: turns,
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      height: 35.0,
                      width: 35.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.black,
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: const Icon(
                        Icons.arrow_downward,
                        size: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget that holds hover animation for the text
class ForHover extends StatefulWidget {
  final String? text;

  const ForHover({super.key, required this.text});

  @override
  _ForHoverState createState() => _ForHoverState();
}

class _ForHoverState extends State<ForHover> {
  Color? hoverColor;
  Color? textColor;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) {
        // Change color on hover
        setState(() {
          hoverColor = Colors.green;
          textColor = Colors.white;
        });
      },
      onExit: (value) {
        // Revert color when not hovering
        setState(() {
          hoverColor = Colors.white;
          textColor = Colors.black;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 25.0,
          vertical: 12.0,
        ),
        color: hoverColor,
        child: Text(
          widget.text!,
          style: TextStyle(
            fontSize: 16.0,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
