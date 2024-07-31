import 'package:flutter/cupertino.dart';

// this code makes our app responsive
// The concept of this code is 
// if the screen width is less then or equal to 600 then it is mobile screen otherwise it is desktop and its take the full width of the device

class Responsiv {
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width <= 600;
  }
  static double widthOfScreen(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
