import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedSearchBar extends StatefulWidget {
  const AnimatedSearchBar({super.key});

  @override
  State<AnimatedSearchBar> createState() => _AnimatedSearchBarState();
}

class _AnimatedSearchBarState extends State<AnimatedSearchBar>
    with SingleTickerProviderStateMixin {
  late TextEditingController _textEditingController;
  late AnimationController
      _animationController; // Animation Controller for rotating the mic icon.
  bool isExpanded =
      false; // Boole to track it the search bar is expanded or not
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue[50],
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            width: isExpanded ? 280 : 50,
            height: 50,
            decoration:  BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow:const [
                BoxShadow(
                  color: Colors.black26,
                  spreadRadius: -5.0,
                  blurRadius: 5.0,
                  offset: Offset(0.0, 7.0),
                ),
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isExpanded =
                            !isExpanded; // Toggle the isExpanded state.
                        if (isExpanded) {
                          _animationController
                              .forward(); // Start the mic rotation animation.
                        } else {
                          _textEditingController
                              .clear(); // Clear the text field when collapsed.
                          _animationController
                              .reverse(); // Reverse the mic rotation animation.
                        }
                      });
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.search,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                   
                
               Expanded(
                  child: AnimatedOpacity(
                    opacity: isExpanded
                        ? 1.0
                        : 0.0, // Change opacity based on isExpanded value initial 0 after expanded 1
                    duration: const Duration(
                        milliseconds:
                            200), // Duration for the opacity animation.
                    child: TextField(
                      controller:
                          _textEditingController, // Controller for the text field.
                      cursorRadius: const Radius.circular(10.0),
                      cursorWidth: 2.0,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: 'Search...',
                        labelStyle: const TextStyle(
                          color: Colors.black54,
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Visibility(
                      visible: isExpanded, // Visibility based on isexpanded value
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: AnimatedBuilder(
                          animation: _animationController,
                          builder: (context, child) {
                            return Transform.rotate(
                              angle: _animationController.value * 2 * pi,
                              child: child,
                            );
                          },
                          child: Icon(Icons.mic, size: 20),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
