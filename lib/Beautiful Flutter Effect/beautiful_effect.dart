import 'package:flutter/material.dart';
import 'package:flutter_example/Beautiful%20Flutter%20Effect/color_palette.dart';
import 'package:provider/provider.dart';

class BeautifulFlutterEffect extends StatefulWidget {
  const BeautifulFlutterEffect({super.key});

  @override
  State<BeautifulFlutterEffect> createState() => _BeautifulFlutterEffectState();
}

class _BeautifulFlutterEffectState extends State<BeautifulFlutterEffect> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // main container
      body: Container(
        height: size.height,
        width: size.width,
        // background color of main container
        color: Theme.of(context).colorScheme.primary,
        child: Align(
          alignment: Alignment.bottomCenter,
          // colorpalette container
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(20),
            height: 100,
            width: 690,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              // background color
              color: Colors.white38,
            ),
            child: OverflowBox(
              maxHeight: 160,
              minHeight: 80,
              alignment: Alignment.bottomCenter,
              child: Stack(
                children: [
                  // listen to changes in ColorPaletteState
                  Consumer<ColorPaletteState>(
                      builder: (context, paletteState, child) {
                    return Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        children: paletteState.availableColorPalette
                            .map<Widget>((palette) {
                          return GestureDetector(
                            onTap: () {
                              paletteState.changeSelectedColor(palette);
                            },
                            child: MouseRegion(
                              // we used mouseRegion widget for hover effect
                              onEnter: (event) {
                                paletteState.changeHoveredColor(palette);
                              },
                              onExit: (event) {
                                paletteState.changeHoveredColor(null);
                              },
                              child: SizedBox(
                                height: 180,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 350),
                                      // the main logic behind that animation and effect is here
                                      height: paletteState
                                                  .hoveredColorPalette ==
                                              palette
                                          ? 95
                                          : paletteState.hoveredColorPalette ==
                                                  null
                                              ? 60
                                              : (paletteState.hoveredColorPalette!
                                                              .index ==
                                                          palette.index - 1 ||
                                                      paletteState
                                                              .hoveredColorPalette!
                                                              .index ==
                                                          palette.index + 1)
                                                  ? 70
                                                  : 50,

                                      width: paletteState.hoveredColorPalette ==
                                              palette
                                          ? 95
                                          : paletteState.hoveredColorPalette ==
                                                  null
                                              ? 60
                                              : (paletteState.hoveredColorPalette!
                                                              .index ==
                                                          palette.index - 1 ||
                                                      paletteState
                                                              .hoveredColorPalette!
                                                              .index ==
                                                          palette.index + 1)
                                                  ? 65
                                                  : 50,
                                      margin: EdgeInsets.symmetric(
                                        horizontal:
                                            paletteState.hoveredColorPalette ==
                                                    palette
                                                ? 15
                                                : 5,
                                        vertical: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: palette.color,
                                        border: Border.all(
                                          color: paletteState
                                                      .hoveredColorPalette ==
                                                  palette
                                              ? Colors.white70
                                              : Colors.transparent,
                                          width: 3,
                                        ),
                                      ),
                                    ),
                                    // now we make it
                                    // move to the top in hover
                                    AnimatedContainer(
                                      duration: Duration(milliseconds: 350),
                                      margin: EdgeInsets.only(
                                        top: paletteState.hoveredColorPalette ==
                                                palette
                                            ? 40
                                            : paletteState
                                                        .hoveredColorPalette ==
                                                    null
                                                ? 5
                                                : (paletteState.hoveredColorPalette!
                                                                .index ==
                                                            palette.index - 1 ||
                                                        paletteState
                                                                .hoveredColorPalette!
                                                                .index ==
                                                            palette.index + 1)
                                                    ? 20
                                                    : 5,
                                      ),
                                      // Animated dot indicator for hovered color
                                      height: 7,
                                      width: 7,
                                      decoration: BoxDecoration(
                                        color:
                                            paletteState.hoveredColorPalette ==
                                                    palette
                                                ? Colors.white70
                                                : Colors.transparent,
                                        borderRadius: BorderRadius.circular(20),
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
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
