import 'package:flutter/material.dart';
import 'package:flutter_example/Ecommerce%20App%20UI/Screen/bottom_app_bar.dart';

void main() {
  runApp(const MyApp());
}

// This widget is the root of your application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyBottomNavBar(),
    );
  }
}
