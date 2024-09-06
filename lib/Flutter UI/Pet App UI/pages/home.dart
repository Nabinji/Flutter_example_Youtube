import 'package:flutter/material.dart';
import '../const.dart';
import '../models/cats_model.dart';
import 'detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedCategory = 0;
  int selectedPage = 0;
  List<IconData> icons = [
    Icons.home_outlined,
    Icons.favorite_outline_rounded,
    Icons.chat,
    Icons.person_outline_rounded
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    'Location',
                    style: TextStyle(
                      fontSize: 16,
                      color: black.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: blue,
                    size: 18,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Chicago, ',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: black,
                          ),
                        ),
                        TextSpan(
                          text: 'US',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black12.withOpacity(0.03),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.search),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black12.withOpacity(0.03),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Stack(
                      children: [
                        const Icon(Icons.notifications_outlined),
                        Positioned(
                          right: 5,
                          top: 5,
                          child: Container(
                            height: 7,
                            width: 7,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  color: blueBackground,
                  child: Stack(children: [
                    Positioned(
                      bottom: -20,
                      right: -30,
                      width: 100,
                      height: 100,
                      child: Transform.rotate(
                        angle: 12,
                        child: Image.network(
                          "https://clipart-library.com/images/rTnrpap6c.png",
                          color: pawColor2,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -35,
                      left: -15,
                      width: 100,
                      height: 100,
                      child: Transform.rotate(
                        angle: -12,
                        child: Image.network(
                          "https://clipart-library.com/images/rTnrpap6c.png",
                          color: pawColor2,
                        ),
                      ),
                    ),
                    Positioned(
                      top: -40,
                      left: 120,
                      width: 110,
                      height: 110,
                      child: Transform.rotate(
                        angle: -16,
                        child: Image.network(
                          "https://clipart-library.com/images/rTnrpap6c.png",
                          color: pawColor2,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 20,
                      height: 170,
                      child: Image.asset('assets/pets-image/cat1.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Join Our Animal\nLovers Community',
                            style: TextStyle(
                              height: 1.1,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.amberAccent,
                            ),
                            child: const Text(
                              'Join Now',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ]),
                ),
              ),
            ),
            const SizedBox(height: 30),
            categoriesName('Categories', "View All"),
            const SizedBox(height: 25),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black12.withOpacity(0.03),
                    ),
                    child: const Icon(
                      Icons.tune_rounded,
                    ),
                  ),
                  ...List.generate(
                    categories.length,
                    (index) => Padding(
                      padding: index == 0
                          ? const EdgeInsets.symmetric(horizontal: 20)
                          : const EdgeInsets.only(right: 20),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategory = index;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 18,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: selectedCategory == index
                                ? buttonColor
                                : Colors.black12.withOpacity(0.03),
                          ),
                          child: Text(
                            categories[index],
                            style: poppins.copyWith(
                              color: selectedCategory == index
                                  ? Colors.white
                                  : black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            categoriesName('Adopt Pet', "View All"),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  cats.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                              cat: cats[index],
                            ),
                          ),
                        );
                      },
                      child: CatItem(
                        cat: cats[index],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            icons.length,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  selectedPage = index;
                });
              },
              child: Container(
                height: 60,
                width: 50,
                padding: const EdgeInsets.all(5),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SizedBox(
                      height: 60,
                      width: 50,
                      child: Column(
                        children: [
                          Icon(
                            icons[index],
                            size: 30,
                            color: selectedPage == index
                                ? blue
                                : black.withOpacity(0.6),
                          ),
                          const SizedBox(height: 5),
                          selectedPage == index
                              ? Container(
                                  height: 5,
                                  width: 5,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: blue,
                                  ),
                                )
                              : Container()
                        ],
                      ),
                    ),
                    index == 2
                        ? Positioned(
                            right: 0,
                            top: -10,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: buttonColor,
                              ),
                              child: Text(
                                '4',
                                style: poppins.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        : Container()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding categoriesName(name, viewAll) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: black,
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Text(
                viewAll,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.amber,
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.amber,
                ),
                child: const Icon(
                  Icons.keyboard_arrow_right_rounded,
                  size: 14,
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CatItem extends StatelessWidget {
  final Cat cat;
  const CatItem({
    super.key,
    required this.cat,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        height: size.height * 0.3,
        width: size.width * 0.55,
        color: cat.color.withOpacity(0.5),
        child: Stack(
          children: [
            Positioned(
              bottom: -10,
              right: -10,
              height: 100,
              width: 100,
              child: Transform.rotate(
                angle: 12,
                child: Image.network(
                  'https://clipart-library.com/images/rTnrpap6c.png',
                  color: cat.color,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 100,
              left: -25,
              height: 90,
              width: 90,
              child: Transform.rotate(
                angle: -11.5,
                child: Image.network(
                  'https://clipart-library.com/images/rTnrpap6c.png',
                  color: cat.color,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: -10,
              right: 10,
              child: Hero(
                tag: cat.image,
                child: Image.asset(
                  cat.image,
                  height: MediaQuery.of(context).size.height * 0.23,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cat.name,
                          style: const TextStyle(
                            fontSize: 20,
                            color: black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: blue,
                              size: 18,
                            ),
                            Text(
                              'Distance (${cat.distance} Km)',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      cat.fav
                          ? Icons.favorite_rounded
                          : Icons.favorite_outline_rounded,
                      color: cat.fav ? red : black.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
