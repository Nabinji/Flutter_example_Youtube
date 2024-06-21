import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_example/Story%20App/Model/info.dart';
import 'package:flutter_example/Story%20App/story_screen.dart';

class ScrollObject extends StatelessWidget {
  final double currentPage;
  final double padding = 15;
  final double verticalInset = 20;

  const ScrollObject(this.currentPage, {super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widgetAspectRation,
      child: LayoutBuilder(
        builder: (context, constraints) {
          // for scroll object height and width
          var width = constraints.maxWidth;
          var height = constraints.minHeight;

          var safeWidth = width - padding;
          var safeHeight = height - 2 * padding;

          var heightOfPrimaryCard = safeHeight;
          var widthOfPrimaryCard = heightOfPrimaryCard * carAapectRation;

          var primaryCardLeft = safeWidth - widthOfPrimaryCard;
          var horizontalInset = primaryCardLeft / 2;
          List<Widget> cardList = <Widget>[];
          for (var i = 0; i < images.length; i++) {
            var delta = i - currentPage;
            bool isOnRight = delta > 0;
            var start = padding +
                max(
                    primaryCardLeft -
                        horizontalInset * -delta * (isOnRight ? 15 : 1),
                    0.0);
            var cardItems = Positioned.directional(
              top: padding + verticalInset * max(-delta, 0),
              bottom: padding + verticalInset * max(-delta, 0),
              start: start,
              textDirection: TextDirection.rtl,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(3.0, 6.0),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: AspectRatio(
                    aspectRatio: carAapectRation,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          images[i],
                          fit: BoxFit.cover,
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 8,
                                ),
                                child: Text(
                                  title[i],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                  ),
                                  onPressed: () {},
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10,),
                                    child: Text(
                                      "Read Late",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
            cardList.add(cardItems);
          }
          return Stack(
            children: cardList,
          );
        },
      ),
    );
  }
}
