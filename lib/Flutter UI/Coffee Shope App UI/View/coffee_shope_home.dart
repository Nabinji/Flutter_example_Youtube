import 'package:flutter/material.dart';
import 'package:flutter_example/Flutter%20UI/Coffee%20Shope%20App%20UI/Utils/colors.dart';
import '../Model/coffee_model.dart';
import 'coffee_details.dart';

class CoffeeHomeScreen extends StatelessWidget {
  const CoffeeHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  height: 65,
                  width: 60,
                  child: Image.asset("image/coffee-shop-image/shope_logo.png"),
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
              SizedBox(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: const TextStyle(
                      color: Colors.black26,
                      fontSize: 22,
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 35,
                    ),
                    filled: true,
                    fillColor: fillColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 2.5 / 3,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                     itemCount: coffeelist.length,
                    itemBuilder: (contex, index) => GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (contex) => CoffeeDetails(
                            coffee: coffeelist[index],
                          ),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 20,
                        ),
                        decoration: BoxDecoration(
                          color: coffeelist[index].color,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    coffeelist[index].name,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 20,
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
                                        coffeelist[index]
                                            .color
                                            .withOpacity(0.2),
                                        Colors.black54,
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.bottomCenter,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    size: 32,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Hero(
                                tag: coffeelist[index].image,
                                child: Image.asset(
                                  coffeelist[index].image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                   
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
