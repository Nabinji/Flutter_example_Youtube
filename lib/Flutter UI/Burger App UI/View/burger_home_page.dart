import 'package:flutter/material.dart';
import 'package:flutter_example/Flutter%20UI/Burger%20App%20UI/Model/burget_model.dart';
import 'package:flutter_example/Flutter%20UI/Burger%20App%20UI/View/burger_items_details.dart';

class BurgerHomePage extends StatefulWidget {
  const BurgerHomePage({super.key});

  @override
  State<BurgerHomePage> createState() => _BurgerHomePageState();
}

class _BurgerHomePageState extends State<BurgerHomePage> {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // for top menu and profile
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // menu
                      Stack(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(2, 3),
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 5),
                              ],
                            ),
                            child: Center(
                              child: Image.asset(
                                "image/menu.png",
                                width: 40,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 2,
                            top: 5,
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
                      // for profile
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.orange.withOpacity(0.1),
                        ),
                        child: Center(
                          child: Image.network(
                              "https://attic.sh/tczugwu6mhih9myfm57850cqic36"),
                        ),
                      )
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
                          style: TextStyle(fontSize: 40),
                        ),
                        Text(
                          "burger for you 🍔",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: size.height * 0.04),
                // for search bar
                searchBar(),
                const SizedBox(height: 40),
                // for category selection
                categorySelection(),
                const SizedBox(height: 5),
                const Text(
                  "Most Popular",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 15),
                Visibility(
                  visible: selectedIndex == 0 ? true : false,
                  child: SizedBox(
                    width: size.width,
                    height: 270,
                    child: ListView.builder(
                        itemCount: burgers.length,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final burgurs = burgers[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BurgerItemsDetails(
                                    burger: burgurs,
                                  ),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: size.width / 2,
                                margin: const EdgeInsets.only(
                                  right: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 7,
                                      offset: const Offset(0, 5),
                                      color: Colors.grey.withOpacity(0.2),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Stack(
                                  children: [
                                    // for favorite
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          burgurs.isFavorited =
                                              !burgurs.isFavorited;
                                        });
                                      },
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          padding: const EdgeInsets.all(6),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: burgurs.isFavorited
                                                ? Colors.pink.shade50
                                                : Colors.grey.shade200,
                                          ),
                                          child: Icon(
                                            Icons.favorite,
                                            color: burgurs.isFavorited
                                                ? Colors.red
                                                : Colors.black26,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        // for image
                                        Hero(
                                          tag: burgurs.image,
                                          child: Image.network(burgurs.image,
                                              height: 120),
                                        ),
                                        const SizedBox(height: 10),
                                        // for name
                                        Text(
                                          burgurs.name,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        // for rating
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
                                              "${burgurs.rating} | ",
                                              style: TextStyle(
                                                  color: Colors.grey.shade700,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              burgurs.distance,
                                              style: TextStyle(
                                                  color: Colors.grey.shade700,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 15),
                                        // for price
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
                                              "${burgurs.price}",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 22,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
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
                        horizontal: 20,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Text(
                          categoryList[index],
                          style: TextStyle(
                              color: selectedIndex == index
                                  ? Colors.black
                                  : Colors.black45,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  Padding searchBar() {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Findy your burger",
          hintStyle: const TextStyle(
            fontSize: 18,
            color: Colors.black38,
          ),
          prefixIcon: const Icon(Icons.search, size: 30),
          filled: true,
          fillColor: Colors.grey.shade100,
          contentPadding: const EdgeInsets.all(20),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade200,
              ),
              borderRadius: BorderRadius.circular(15)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade200,
              ),
              borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}
