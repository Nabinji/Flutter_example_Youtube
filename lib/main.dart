import 'package:flutter/material.dart';
import 'package:flutter_example/MacOs%20Like%20Animation/effect_like_macos.dart';
import 'package:provider/provider.dart';
import 'MacOs Like Animation/color_palette.dart';

void main() {
  runApp(const MyApp());
}

// This widget is the root of your application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // Provides an instance of ColorPaletteState to the widget tree
      create: (context) => ColorPaletteState(),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            // Uses the selected color from ColorPaletteState to create a color scheme
            colorScheme: ColorScheme.fromSeed(
              seedColor: context.watch<ColorPaletteState>().selectedColor.color,
              primary: context.watch<ColorPaletteState>().selectedColor.color,
            ),
            useMaterial3: true,
          ),
          home: const EffectLikeMacos(), // Sets the home widget
        );
      },
    );
  }
}
