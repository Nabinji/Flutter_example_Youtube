import 'package:flutter/widgets.dart';

class SizeConfig {
  static double screenWidth = 0;
  static double screenHeight = 0;
  static double horizontalSize = 0;
  static double verticalSize = 0;

  static double textMultiplier = 0;
  static double imageSizeMultiplier = 0;
  static double heightMultiplier = 0;

  void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    horizontalSize = screenWidth / 100;
    verticalSize = screenHeight / 100;

    textMultiplier = verticalSize;
    imageSizeMultiplier = horizontalSize;
    heightMultiplier = verticalSize;
  }
}
