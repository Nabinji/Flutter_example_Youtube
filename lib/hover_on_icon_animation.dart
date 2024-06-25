import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BeautifulSocialIcon extends StatefulWidget {
  const BeautifulSocialIcon({super.key});

  @override
  _BeautifulSocialIconState createState() => _BeautifulSocialIconState();
}

class _BeautifulSocialIconState extends State<BeautifulSocialIcon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PopupIcon(
              icon: FontAwesomeIcons.instagram,
              color: Color(0xffe1306c),
              text: 'Instagram',
            ),
            PopupIcon(
              icon: FontAwesomeIcons.github,
              color: Color(0xff333333),
              text: 'GitHub',
            ),
            PopupIcon(
              icon: FontAwesomeIcons.facebook,
              color: Color(0xff0088cc),
              text: 'Telegram',
            ),
            PopupIcon(
              icon: FontAwesomeIcons.youtube,
              color: Color(0xffde463b),
              text: 'Youtube',
            ),
            PopupIcon(
              icon: FontAwesomeIcons.linkedin,
              color: Color(0xff0e76a8),
              text: 'LinkedIn',
            ),
          ],
        ),
      ),
    );
  }
}

class PopupIcon extends StatefulWidget {
  final IconData icon;
  final Color color;
  final String text;

  const PopupIcon({
    super.key,
    required this.icon,
    required this.color,
    required this.text,
  });

  @override
  _PopupIconState createState() => _PopupIconState();
}

class _PopupIconState extends State<PopupIcon> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.green,
      margin: const EdgeInsets.only(right: 2),
      height: 105.0,
      width:85.0,
      child: Stack(
        children: [
          // Display the icon name after hover on icon
          AnimatedOpacity(
            opacity: isHover ? 1 : 0.0, // opacity(brightness) of hover icon text
            duration: const Duration(milliseconds: 100),//  time taken to remove icon name
            child: AnimatedAlign(
              alignment: isHover
                  ? const Alignment(0.0, -1.0) // in which direction icon name should be display
                  : const Alignment(0.0, 0.0),
              duration: const Duration(milliseconds: 200),// time taken to display the icon name
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                //trangle 
                  Positioned(
                    left: 40.0,
                    top: 30.0,
                    child: Transform(
                      transform: Matrix4.rotationZ(pi / 4),
                      alignment: FractionalOffset.center,
                      child: Container(
                        height: 10.0,
                        width: 10.0,
                        color: widget.color,
                      ),
                    ),
                  ),
                  // icon name 
                  Container(
                    height: 35.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: widget.color,
                    ),
                    child: Center(
                      child: Text(
                        widget.text,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // for social icon 
          
          Align(
            alignment: Alignment.bottomCenter,
            child: MouseRegion(
              onEnter: (value) {
                setState(() {
                  isHover = true;
                });
              },
              onExit: (value) {
                setState(() {
                  isHover = false;
                });
              },
              child: AnimatedContainer(
                height: 60.0,
                width: 60.0,
                duration: const Duration(milliseconds: 375),
                decoration: BoxDecoration(
                  color: isHover ? widget.color : Colors.white,
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Icon(
                  widget.icon,size: 30,
                  color: isHover ? Colors.white : widget.color,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
