import 'package:flutter/material.dart';
import 'package:flutter_example/Flutter%20UI/Burger%20App%20UI/Model/burget_model.dart';

class DetailPage extends StatefulWidget {
  final Burger burger;
  const DetailPage({super.key, required this.burger});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int total = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // for back and favorite button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                      ),
                    ),
                    const Text(
                      "Details",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border,
                      ),
                    )
                  ],
                ),
                // for image
                Center(
                  child: Image.network(
                    widget.burger.image,
                    height: 350,
                  ),
                ),
                // for rating
                Container(
                  width: 60,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 20,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        widget.burger.rating.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // for items name
                    SizedBox(
                      width: 200,
                      child: Text(
                        widget.burger.name,
                        style: const TextStyle(
                          height: 1.2,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          wordSpacing: 2,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    // for no of items increment and decrement
                    Container(
                      width: 100,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                              onTap: () {
                                if (total < 1) {
                                  setState(() {
                                    total = 1;
                                  });
                                } else if (total > 1) {
                                  setState(() {
                                    total -= 1;
                                  });
                                }
                              },
                              child: const Text(
                                "-",
                                style: TextStyle(fontSize: 30),
                              )),
                          Text(
                            "$total",
                            style: const TextStyle(fontSize: 20),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                total += 1;
                              });
                            },
                            child: const Text(
                              "+",
                              style: TextStyle(fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15),
                // of required ingredients
                const Text(
                  "Ingredients",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ingredientsBox("🧀", "Cheese"),
                      ingredientsBox("🍖", "Beef"),
                      ingredientsBox("🍅", "Tomato"),
                      ingredientsBox("🧅", "Onions"),
                      ingredientsBox("🍞", "Bread"),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // for description
                const Text(
                  "Description",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.burger.description,
                  style: const TextStyle(
                    fontSize: 17,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // for price and add to cart button
      floatingActionButton: FloatingActionButton.extended(
        elevation: 0,
        backgroundColor: Colors.white,
        onPressed: () {},
        label: Row(
          children: [
            const Text(
              "\$",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "${widget.burger.price}",
              style: const TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 50),
            Container(
              width: 230,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text(
                  "Add to cart",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding ingredientsBox(icon, name) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Container(
        padding: const EdgeInsets.all(5),
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade100,
              offset: const Offset(0, 4),
              blurRadius: 5,
            )
          ],
        ),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Text(
              icon,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 5),
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            )
          ],
        ),
      ),
    );
  }
}
