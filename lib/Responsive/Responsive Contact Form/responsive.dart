import 'package:flutter/material.dart';
class Responsive {
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width <= 600;
  }

  static double widthOfScreen(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
