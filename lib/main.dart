import 'package:flutter/material.dart';
import 'package:flutter_example/Audio%20Player/audio_player.dart';


void main() {
  runApp(const MyApp());
}

// This widget is the root of your application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AudioPlayerWidget(),
    );
  }
}
