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
  // declare variables for animation
  double height = 150;
  double bottomHeight = 140;
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
              //Container that holds the list of items
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: bottomHeight,
                width: 390,
                child: const SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      // call the items that display after click on arrow_down button
                      SizedBox(
                        height: 150,
                      ),
                      ForHover(text: "Youtube"),
                      ForHover(text: "Twitter"),
                      ForHover(text: "LinkedIn"),
                      ForHover(text: "Facebook"),
                      ForHover(text: "GitHub"),
                    ],
                  ),
                ),
              ),
              // Container that holds the main profiles section
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
                        // for profile picture
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://media.licdn.com/dms/image/D4E03AQFUcpGFAGfQnA/profile-displayphoto-shrink_200_200/0/1680274769856?e=2147483647&v=beta&t=kSMPiQ4PHJ2BuepGMpaQGvq8Vo_2GDaoPi8X3-YOz2A"),
                          radius: 40,
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
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
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              // For button to expand/collaps the list
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    setState(() {
                      height = height == 150
                          ? 400
                          : 150; // it means when we click on this icon it height is expand from 150 to 400 otherwise it is 150
                      bottomHeight = bottomHeight == 140 ? 400 : 140;
                      turns = turns == 0.5
                          ? 1
                          : 0.5; // when icon is click and move down it change to opposit direction otherwise as it is
                    });
                  },
                  child: AnimatedRotation(
                    turns: turns,
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black,
                      ),
                      child: const Icon(
                        Icons.arrow_downward,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Widget that holds hover animation for the text and its background
class ForHover extends StatefulWidget {
  final String text;
  const ForHover({super.key, required this.text});

  @override
  State<ForHover> createState() => _ForHoverState();
}

class _ForHoverState extends State<ForHover> {
  Color? hoverColor;
  Color? textColor;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        // change color on hover
        setState(() {
          hoverColor = Colors.green;
          textColor = Colors.white;
        });
      },
      // Revert color when not hovering
      onExit: (event) {
        setState(() {
          hoverColor = Colors.white;
          textColor = Colors.black;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: hoverColor,
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: 16,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
