import 'package:flutter/material.dart';
import 'package:flutter_example/Flutter%20UI/Coffee%20Shope%20App%20UI/Model/coffee_model.dart';
import 'package:flutter_example/Flutter%20UI/Coffee%20Shope%20App%20UI/Utils/colors.dart';
import 'package:flutter_example/Flutter%20UI/Coffee%20Shope%20App%20UI/View/coffee_detail_screen.dart';

class CoffeeShopHomeScreen extends StatefulWidget {
  const CoffeeShopHomeScreen({super.key});

  @override
  State<CoffeeShopHomeScreen> createState() => _CoffeeShopHomeScreenState();
}

class _CoffeeShopHomeScreenState extends State<CoffeeShopHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  "image/coffee-shop-image/shope_logo.png",
                  height: 70,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "House Signature",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              searchBox(),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: GridView.builder(
                    itemCount: coffeelist.length,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 0.8,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                    itemBuilder: (context, index) {
                      final coffee = coffeelist[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  CoffeeDetailScreen(coffee: coffee),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: coffee.color,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 20,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      coffee.name,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                          colors: [
                                            coffee.color.withOpacity(0.2),
                                            Colors.black54
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.bottomCenter),
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 32,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Hero(
                                  tag: coffee.image,
                                  child: Image.asset(
                                    coffee.image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
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
    );
  }

  SizedBox searchBox() {
    return SizedBox(
      height: 52,
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: const TextStyle(color: Colors.black26, fontSize: 22),
          prefixIcon: const Icon(
            Icons.search,
            size: 35,
          ),
          filled: true,
          fillColor: fillColor,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
