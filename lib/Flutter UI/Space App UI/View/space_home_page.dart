import 'package:flutter/material.dart';
import 'package:flutter_example/Flutter%20UI/Space%20App%20UI/Model/category.dart';
import 'package:flutter_example/Flutter%20UI/Space%20App%20UI/Model/image.dart';

class SpaceHomePage extends StatefulWidget {
  const SpaceHomePage({super.key});

  @override
  State<SpaceHomePage> createState() => _SpaceHomePageState();
}

class _SpaceHomePageState extends State<SpaceHomePage> {
  int selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                // profile and title
                profileAndTitle(),
                const SizedBox(height: 30),
                // for category items
                selectCategory(),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildContentCard(size, "Mars", mars, "270"),
                    buildContentCard(size, "Venus", venus, "176"),
                  ],
                ),
                const SizedBox(height: 15),
                coverImageOfPlanet(
                    size, cassiniSaturn, "Cassini \non Saturn", "251 views"),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildContentCard(size, "Mercury", mercury, "340"),
                    buildContentCard(size, "Earth", earth, "746"),
                  ],
                ),
                const SizedBox(height: 40),
                coverImageOfPlanet(
                    size, earthSurvey, "Earth Survey", "555 views"),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildContentCard(size, "Uranus", uranus, "601"),
                    buildContentCard(size, "Jupiter", jupiter, "100"),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildContentCard(size, "Saturn", saturn, "111"),
                    buildContentCard(size, "Neptune", neptune, "90"),
                  ],
                ),
              ],
            ),
          ),
        ),
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
                  icon: Icon(
                    Icons.home_filled,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                  ),
                  label: ""),
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

  Container coverImageOfPlanet(Size size, image, title, views) {
    return Container(
      width: size.width,
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(image),
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.w900,
                      height: 1.1,
                      color: Colors.white),
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(
                      Icons.visibility,
                      color: Colors.white.withOpacity(0.7),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      views,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 15),
              ],
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  SizedBox buildContentCard(Size size, title, imageurl, viesw) {
    return SizedBox(
      width: size.width / 2.2,
      height: 200,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: size.width / 2.2,
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
                          "$viesw views",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.3),
                          ),
                        )
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
                imageurl,
                height: 110,
                width: 110,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox selectCategory() {
    return SizedBox(
      height: 70,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: spaceCategory.length,
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
                        color: selectedIndex == index
                            ? Colors.white
                            : Colors.black,
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
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Row profileAndTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 40,
          height: 40,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(profile),
            ),
          ),
        ),
        const Text(
          'Feed',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.w900,
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
    );
  }
}
