import 'package:flutter/material.dart';
import 'package:flutter_example/Flutter%20UI/Space%20App%20UI/Model/category.dart';
import 'package:flutter_example/Flutter%20UI/Space%20App%20UI/Model/image.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  // Profile & Title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(profile),
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const Text(
                        "Feed",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 40,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.grid_view_sharp,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  // category items
                  categorySelection(),
                  const SizedBox(height: 25),
                  // List of content cards
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildContentCard(
                        "Mars",
                        mars,
                        "270",
                      ),
                      buildContentCard(
                        "Venus",
                        venus,
                        "176",
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  // Banner
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(cassiniSaturn),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const SizedBox(width: 10),
                            const Text(
                              "Cassini \non Saturn",
                              style: TextStyle(
                                height: 1.1,
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 38,
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Icon(Icons.visibility,
                                    color: Colors.white.withOpacity(0.7)),
                                const SizedBox(width: 5),
                                const Text(
                                  "6746 views",
                                  style: TextStyle(
                                      color: Colors.white60, fontSize: 16),
                                ),
                              ],
                            ),
                            const SizedBox(width: 15),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Another list of content cards
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildContentCard(
                        "Mercury",
                        mercury,
                        "340",
                      ),
                      buildContentCard(
                        "Earth",
                        earth,
                        "746",
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(earthSurvey),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const SizedBox(width: 10),
                            const Text(
                              "Earth Survey",
                              style: TextStyle(
                                height: 1.1,
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 38,
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Icon(Icons.visibility,
                                    color: Colors.white.withOpacity(0.7)),
                                const SizedBox(width: 5),
                                const Text(
                                  "11101 views",
                                  style: TextStyle(
                                      color: Colors.white60, fontSize: 16),
                                ),
                              ],
                            ),
                            const SizedBox(width: 15),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildContentCard(
                        "Uranus",
                        uranus,
                        "601",
                      ),
                      buildContentCard(
                        "Jupiter",
                        jupiter,
                        "100",
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildContentCard(
                        "Saturn",
                        saturn,
                        "111",
                      ),
                      buildContentCard(
                        "Neptune",
                        neptune,
                        "198",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Stack(
        children: [
          BottomNavigationBar(
            selectedFontSize: 0,
            unselectedFontSize: 0,
            selectedItemColor: const Color.fromARGB(255, 103, 117, 247),
            unselectedItemColor: Colors.grey.shade700,
            backgroundColor: Colors.black,
            iconSize: 35,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search_rounded),
                label: "",
              ),
            ],
          ),
          const Positioned(
            left: 0,
            right: 0,
            child: Icon(
              Icons.add_circle_outlined,
              size: 55,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  // Widget for reusable content card
  Widget buildContentCard(String title, String imageUrl, String views) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2.2,
      height: 200,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2.2,
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: 1.5,
                    color: Colors.white.withOpacity(0.3),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 25,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.visibility,
                          color: Colors.white.withOpacity(0.3),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "$views views",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.3),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: -20,
            right: 40,
            child: Center(
              child: Image.network(
                imageUrl,
                width: 110,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox categorySelection() {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: spaceCategory.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color:
                          selectedIndex == index ? Colors.white : Colors.black,
                      border: Border.all(color: Colors.white38),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        spaceCategory[index],
                        style: TextStyle(
                          color: selectedIndex == index
                              ? Colors.black
                              : Colors.white54,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
