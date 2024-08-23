import 'package:flutter/material.dart';
import 'package:flutter_example/Music%20Player/color.dart';

class MusicPlayerUI extends StatefulWidget {
  const MusicPlayerUI({super.key});

  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<MusicPlayerUI> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: myBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // for back button and popup menu button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customButton(
                  35,
                  const Icon(Icons.arrow_back_ios),
                ),
                customButton(
                  35,
                  const Icon(Icons.more_horiz),
                ),
              ],
            ),
            // for music image
            Stack(
              children: [
                Container(
                  width: size.width / 1.2,
                  height: size.width / 1.2,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [darkShadowColor, lightShadowColor],
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: darkShadowColor,
                            offset: const Offset(8, 6),
                            blurRadius: 10),
                        BoxShadow(
                          blurRadius: 10,
                          color: lightShadowColor,
                          offset: const Offset(-8, -6),
                        ),
                      ]),
                ),
                const Positioned(
                  top: 10,
                  bottom: 10,
                  right: 10,
                  left: 10,
                  child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://img.freepik.com/premium-photo/guitar-headphone-music-cartoon-vector-icon-illustration-music-holiday-icon-concept-isolated_839035-1114282.jpg?w=1480")
                      //  AssetImage("image/logo.png"),
                      ),
                ),
              ],
            ),
            // for music name and singer
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "I Never Loved a Man the Way I Love You",
                maxLines: 1,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 24,
                  color: myTextColor,
                ),
              ),
            ),
            Text(
              "Aretha Franklin",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: myTextColor,
              ),
            ),
            // for music level
            const SizedBox(height: 40),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 25,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: myBackgroundColor,
                    boxShadow: [
                      BoxShadow(
                        color: lightShadowColor,
                        offset: const Offset(2, 5),
                        // blurRadius: 10,
                      ),
                      BoxShadow(
                        color: darkShadowColor,
                        offset: const Offset(-2, -5),
                        // blurRadius: 10,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  child: Container(
                    height: 22,
                    width: 150,
                    margin: const EdgeInsets.symmetric(horizontal: 35),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          secondaryLightColor,
                          secondaryDarkColor,
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "1.02",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: myTextColor,
                      fontSize: 20,
                    ),
                  ),
                   Text(
                    "3.22",
                    style: TextStyle(
                      color: myTextColor,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            // for music play, skip, forward,backward button.
            Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customButton(
                  35,
                  const Icon(Icons.arrow_back_ios),

                ),
                 customButton(
                  50,
                   Icon(Icons.play_arrow,size: 60,color:secondaryDarkColor ,),
                ),

                customButton(
                  35,
                  const Icon(Icons.more_horiz),
                ),
              ],)
          ],
        ),
      ),
    );
  }

  Widget customButton(double radius, icon) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          Container(
            width: radius * 2,
            height: radius * 2,
            decoration: BoxDecoration(
              color: myBackgroundColor,
              borderRadius: BorderRadius.circular(radius),
              boxShadow: [
                BoxShadow(
                    color: darkShadowColor,
                    offset: const Offset(9, 7),
                    blurRadius: 10),
                BoxShadow(
                    color: lightShadowColor,
                    offset: const Offset(-9, -7),
                    blurRadius: 10),
              ],
            ),
          ),
          Positioned.fill(child: icon),
        ],
      ),
    );
  }
}
// ui is ready