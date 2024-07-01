import 'package:flutter/material.dart';

class ColorPalette {
  Color color;
  int index;

  ColorPalette({
    required this.color,
    required this.index,
  });
}

class ColorPaletteState extends ChangeNotifier {
  // default selected color
  ColorPalette selectedColor = ColorPalette(
    color: Colors.black,
    index: 0,
  );

  ColorPalette? hoveredColorPalette;
// list of color available
  List<ColorPalette> availableColorPalette = [
    ColorPalette(
      color: Colors.black,
      index: 0,
    ),
    ColorPalette(
      color:Colors.red,
      index: 1,
    ),
    ColorPalette(
      color:Colors.orange,
      index: 2,
    ),
    ColorPalette(
      color: Colors.purple,
      index: 3,
    ),
    ColorPalette(
      color: Colors.pink,
      index: 4,
    ),
    ColorPalette(
      color: Colors.white,
      index: 5,
    ),
    ColorPalette(
      color: Colors.yellow,
      index: 6,
    ),
    ColorPalette(
      color: Colors.green,
      index: 7,
    ),
     ColorPalette(
      color: Colors.blueGrey,
      index:8,
    ),
  ];
// change color after selecting
  void changeSelectedColor(ColorPalette palette) {
    selectedColor =palette;
    notifyListeners();
  }

  void changeHoveredColor(ColorPalette? palette) {
    hoveredColorPalette = palette;
    notifyListeners();
  }
}
