import 'package:flutter/material.dart';
import 'package:flutter_example/Flutter%20UI/Burger%20App%20UI/Model/burget_model.dart';

import 'burger_items_details.dart';


class BurgerHomeScreen extends StatefulWidget {
  const BurgerHomeScreen({super.key});

  @override
  _BurgerHomeScreenState createState() => _BurgerHomeScreenState();
}

class _BurgerHomeScreenState extends State<BurgerHomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // for top menu an profile
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // menu
                      Stack(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(2, 3),
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 5)
                                ]),
                            child: Center(
                              child: Image.asset(
                                "image/menu.png",
                                width: 40,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 5,
                            right: 2,
                            child: Container(
                              height: 10,
                              width: 10,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // profile
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.orange.withOpacity(0.1),
                        ),
                        child: Center(
                          child: Image.network(
                            "https://pbs.twimg.com/media/EJgg_pTXkAAF4WV.png",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.04),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Find and order",
                          style: TextStyle(
                            fontSize: 40,
                          ),
                        ),
                        Text(
                          "burger for you 🍔",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 40,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.04),
                // search bar
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Find your burger",
                      hintStyle: const TextStyle(
                        fontSize: 18,
                        color: Colors.black38,
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 30,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      contentPadding: const EdgeInsets.all(20),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade200,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade200,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                // for category selection
                categorySelection(),
                // display items according to category selection
                const SizedBox(height: 5),
                const Text(
                  "Most popular",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 15),
                Visibility(
                  visible: selectedIndex == 0 ? true : false,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 270,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: burgers.length,
                      itemBuilder: (context, index) {
                        final burger = burgers[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => DetailPage(
                                  burger: burgers[index],
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: size.width / 2,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0, 5),
                                    color: Colors.grey.withOpacity(0.2),
                                    blurRadius: 7,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Stack(
                                children: [
                                  // for favorite
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        burger.isFavorited =
                                            !burger.isFavorited;
                                      });
                                    },
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        padding: const EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: burger.isFavorited
                                              ? Colors.pink.shade50
                                              : Colors.grey.shade200,
                                        ),
                                        child: Icon(
                                          Icons.favorite,
                                          color: burger.isFavorited
                                              ? Colors.red
                                              : Colors.black26,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      // items image
                                      Image.network(
                                        burger.image,
                                        height: 120,
                                      ),
                                      const SizedBox(height: 10),
                                      // name of items
                                      Text(
                                        burger.name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      // rating and distance
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: Colors.orangeAccent,
                                            size: 20,
                                          ),
                                          Text(
                                            " ${burger.rating} | ",
                                            style: TextStyle(
                                              color: Colors.grey.shade700,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            burger.distance,
                                            style: TextStyle(
                                              color: Colors.grey.shade700,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 15),
                                      // price
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "\$",
                                            style: TextStyle(
                                              color: Colors.orange,
                                            ),
                                          ),
                                          Text(
                                            "${burger.price}",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 22),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox categorySelection() {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: ((context, index) {
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
                      horizontal: 20,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        categoryList[index],
                        style: TextStyle(
                          color: selectedIndex == index
                              ? Colors.black
                              : Colors.black45,
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
        }),
      ),
    );
  }
}
