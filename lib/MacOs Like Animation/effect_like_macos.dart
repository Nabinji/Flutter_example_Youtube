import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'color_palette.dart';

class EffectLikeMacos extends StatefulWidget {
  const EffectLikeMacos({super.key});

  @override
  State<EffectLikeMacos> createState() => _EffectLikeMacosState();
}

class _EffectLikeMacosState extends State<EffectLikeMacos> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // Gets the screen size
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: Theme.of(context).colorScheme.primary, // Background color
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.all(20.0),
            height: 100.0,
            width: 690.0,
            decoration: BoxDecoration(
              color: Colors.white38, // Background of the colorpalette container
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: OverflowBox(
              minHeight: 80.0,
              maxHeight: 160.0,
              alignment: Alignment.bottomCenter,
              child: Stack(
                children: [
                  // Listens to changes in ColorPaletteState
                  Consumer<ColorPaletteState>(
                    builder: (context, paletteState, child) {
                      return Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: paletteState.availableColorPalette
                              .map<Widget>((palette) {
                            return GestureDetector(
                              onTap: () {
                                paletteState.changeSelectedColor(palette);
                              }, // Changes selected color on tap
                              child: MouseRegion(
                                onEnter: (value) {
                                  paletteState.changeHoveredColor(palette);
                                }, // Changes hovered color on mouse enter
                                onExit: (value) {
                                  paletteState.changeHoveredColor(null);
                                }, // Resets hovered color on mouse exit
                                child: SizedBox(
                                  height: 180.0,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      // Animated container for color palette
                                      AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 375),
                                        curve: Curves.ease,
                                        height: paletteState.hoveredColorPalette ==
                                                palette
                                            ? 90.0
                                            : paletteState.hoveredColorPalette ==
                                                    null
                                                ? 60.0
                                                : (paletteState
                                                                .hoveredColorPalette!
                                                                .index ==
                                                            palette.index - 1 ||
                                                        paletteState
                                                                .hoveredColorPalette!
                                                                .index ==
                                                            palette.index + 1)
                                                    ? 70.0
                                                    : 50.0,
                                        width: paletteState.hoveredColorPalette ==
                                                palette
                                            ? 95.0
                                            : paletteState.hoveredColorPalette ==
                                                    null
                                                ? 60.0
                                                : (paletteState
                                                                .hoveredColorPalette!
                                                                .index ==
                                                            palette.index - 1 ||
                                                        paletteState
                                                                .hoveredColorPalette!
                                                                .index ==
                                                            palette.index + 1)
                                                    ? 65.0
                                                    : 50.0,
                                        margin: EdgeInsets.symmetric(
                                          horizontal:
                                              paletteState.hoveredColorPalette ==
                                                      palette
                                                  ? 15.0
                                                  : 5.0,
                                          vertical: 5.0,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          color: palette.color,
                                          border: Border.all(
                                            color: paletteState
                                                        .hoveredColorPalette ==
                                                    palette
                                                ? Colors.white70
                                                : Colors.transparent,
                                            width: 3.0,
                                          ),
                                        ),
                                      ),
                                     // move to the top on hover color
                                      AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 375),
                                        curve: Curves.ease,
                                        margin: EdgeInsets.only(
                                          top: paletteState.hoveredColorPalette ==
                                                  palette
                                              ? 40.0
                                              : paletteState.hoveredColorPalette ==
                                                      null
                                                  ? 5.0
                                                  : (paletteState.hoveredColorPalette!
                                                                  .index ==
                                                              palette.index - 1 ||
                                                          paletteState
                                                                  .hoveredColorPalette!
                                                                  .index ==
                                                              palette.index + 1)
                                                      ? 20.0
                                                      : 5.0,
                                        ),
                                         // Animated dot indicator for hovered color
                                        height: 7.0,
                                        width: 7.0,
                                        decoration: BoxDecoration(
                                          color: paletteState.hoveredColorPalette ==
                                                  palette
                                              ? Colors.white70
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
