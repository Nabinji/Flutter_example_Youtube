import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import '../Model/coffee_model.dart';

class CoffeeDetails extends StatefulWidget {
  final Coffee coffee;
  const CoffeeDetails({super.key, required this.coffee});

  @override
  _CoffeeDetailsState createState() => _CoffeeDetailsState();
}

class _CoffeeDetailsState extends State<CoffeeDetails> {
  int quantity = 1;
  bool switchvalue = true;
  bool isFavourite = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: widget.coffee.color,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // for menu and cart icon
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                // vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: Image.asset(
                      "image/coffee-shop-image/menu.png",
                    ),
                  ),
                  const Icon(
                    Icons.shopping_cart_rounded,
                    color: Colors.white,
                    size: 35,
                  )
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // for image
                  Positioned(
                    left: 50,
                    top: 50,
                    child: SizedBox(
                      height: 300,
                      width: 300,
                      child: Hero(
                        tag: widget.coffee.image,
                        child: Image.asset(
                          widget.coffee.image,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(30),
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: Column(
                          children: [
                            // for back and favorite button
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  iconSize: 40,
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    color: widget.coffee.color,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isFavourite = !isFavourite;
                                    });
                                  },
                                  iconSize: 40,
                                  icon: Icon(
                                    isFavourite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: widget.coffee.color,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            // for items name
                            Text(
                              widget.coffee.name,
                              style: const TextStyle(
                                height: 0.7,
                                fontWeight: FontWeight.w700,
                                fontSize: 45,
                              ),
                            ),
                            // for rating
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SmoothStarRating(
                                  rating: widget.coffee.star,
                                  size: 25,
                                  filledIconData: Icons.star,
                                  halfFilledIconData: Icons.star_half,
                                  defaultIconData: Icons.star_border,
                                  starCount: 5,
                                  allowHalfRating: true,
                                  spacing: 2.0,
                                  onRatingChanged: (value) {
                                    setState(() {
                                      widget.coffee.star = value;
                                    });
                                  },
                                ),
                                Container(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    widget.coffee.star.toString(),
                                    style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: size.height * 0.06),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(
                                  // for price
                                  height: 45,
                                  child: Text(
                                    "\$${widget.coffee.price}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 35,
                                    ),
                                  ),
                                ),
                                // no of quantity
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: widget.coffee.color,
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (quantity > 1) {
                                              quantity -= 1;
                                            }
                                          });
                                        },
                                        child: const Center(
                                          child: Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                            size: 35,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Text(
                                        quantity.toString(),
                                        style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: widget.coffee.color,
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            quantity += 1;
                                          });
                                        },
                                        child: const Center(
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 35,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: size.height * 0.04),
                            // for switch button
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "L",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 30,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                CupertinoSwitch(
                                  trackColor: widget.coffee.color,
                                  value: switchvalue,
                                  activeColor: widget.coffee.color,
                                  onChanged: (value) {
                                    setState(() {
                                      switchvalue = value;
                                    });
                                  },
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  "S",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 30,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: size.height * 0.055),
                            Container(
                              height: 70,
                              width: size.width * 0.6,
                              decoration: BoxDecoration(
                                color: widget.coffee.color,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Center(
                                child: Text(
                                  "Order Now",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 30,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
