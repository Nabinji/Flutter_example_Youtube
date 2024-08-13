import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';


import '../Model/universe_model.dart';
import '../Utils/colors.dart';
import 'planet_detail_page.dart';

class UniversHomePage extends StatefulWidget {
  const UniversHomePage({super.key});

  @override
  _UniversHomePageState createState() => _UniversHomePageState();
}

class _UniversHomePageState extends State<UniversHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondGradientColor,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              firstGradientColor,
              secondGradientColor,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // top parts
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Explore",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Row(
                      children: [
                        const Text(
                          "Solar System",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                            color: Colors.white60,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.pink[200],
                          size: 35,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // body parts
              Container(
                height: 675,
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Swiper(
                  itemCount: planets.length,
                  physics: const BouncingScrollPhysics(),
                  itemHeight: 675,
                  itemWidth: double.infinity,
                  layout: SwiperLayout.TINDER,
                  pagination: const SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                    activeSize: 12,
                    size: 8,
                    activeColor: Colors.white,
                    color: Colors.white24,
                  )),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlanetDetailPage(
                              planetInfo: planets[index],
                            ),
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              const SizedBox(height: 100),
                              Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 35,
                                    vertical: 35,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 200),
                                      Text(
                                        planets[index].name,
                                        style: const TextStyle(
                                          fontSize: 50,
                                          color:
                                              Color.fromARGB(255, 71, 69, 95),
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      Text(
                                        "Solar System",
                                        style: TextStyle(
                                          fontSize: 30,
                                          color: primaryTextColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(height: 30),
                                      Row(
                                        children: [
                                          Text(
                                            "Know more ",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: secondaryTextColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward,
                                            color: secondaryTextColor,
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Hero(tag: planets[index].id,
                            child: Image.asset(planets[index].iconImage)),
                          Positioned(
                            right: 40,
                            bottom: 120,
                            child: Text(
                              planets[index].id.toString(),
                              style: TextStyle(
                                fontSize: 260,
                                color: primaryTextColor.withOpacity(0.1),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      // bottom parts
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: navBarColor,
        ),
        padding: const EdgeInsets.all(25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset("image/menu_icon.png"),
                ),
                const Text(
                  "Explore",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 30,
                color: Colors.pink[100],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person_outline_outlined,
                size: 30,
                color: Colors.pink[100],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
