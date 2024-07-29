import 'package:flutter/cupertino.dart';

class Utils {
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width <= 600;
  }

  static double mdqh(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double mdqw(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
