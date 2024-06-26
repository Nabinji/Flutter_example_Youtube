import 'package:flutter/material.dart';
import 'package:flutter_example/Hover%20Animation/hover_to_expand.dart';

void main() {
  runApp(const MyApp());
}

// This widget is the root of your application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HoverToExpand(),
    );
  }
}
