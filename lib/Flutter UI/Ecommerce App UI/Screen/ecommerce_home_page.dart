import 'package:flutter/material.dart';
import 'package:flutter_example/Flutter%20UI/Ecommerce%20App%20UI/Model/category.dart';
import 'package:flutter_example/Flutter%20UI/Ecommerce%20App%20UI/Screen/detail_screen.dart';
import 'package:flutter_example/Flutter%20UI/Ecommerce%20App%20UI/Utils/colors.dart';
import 'package:flutter_example/Flutter%20UI/Ecommerce%20App%20UI/Utils/size.dart';
import 'package:flutter_svg/svg.dart';

import '../Model/product_model.dart';

class EcommerceHomePage extends StatefulWidget {
  const EcommerceHomePage({super.key});

  @override
  State<EcommerceHomePage> createState() => _EcommerceHomePageState();
}

class _EcommerceHomePageState extends State<EcommerceHomePage> {
  int selectedIndex = 0;
  // list of category items
  List<List<Product>> selectedCategory = [
    chairs,
    sofas,
    cupboards,
    table,
    wardrobe,
  ];
  @override
  Widget build(BuildContext context) {
    // Initializing SizeConfig
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: RawMaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            constraints: const BoxConstraints(minWidth: 8),
            fillColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 18),
            onPressed: () {},
            child: SvgPicture.asset(
              "image/ecommerce-image/menu.svg",
              width: 20,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(25),
            child: Text(
              "Discover your best furniture",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
          ),
          // for serach bar
          Padding(
            padding: const EdgeInsets.all(25),
            child: TextField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      )),
                  contentPadding: const EdgeInsets.all(15),
                  filled: true,
                  hintText: "Search",
                  fillColor: Colors.grey[100],
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 30,
                  )),
            ),
          ),
          // for category items
          categorySelection(),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Row(
              children: [
                const Text(
                  "Poular",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 25,
                  ),
                ),
                const Spacer(),
                Text(
                  "View all",
                  style: TextStyle(
                    color: primary,
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                  ),
                )
              ],
            ),
          ),
          // display the product
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(selectedCategory[selectedIndex].length,
                  (index) {
                final product = selectedCategory[selectedIndex][index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetail(product: product),
                      ),
                    );
                  },
                  child: Hero(
                    tag: product.image,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: (SizeConfig.screenWidth - 80) / 2,
                      height: SizeConfig.verticalSize * 30,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(product.image),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // for image name and price
                          Stack(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.title,
                                      style: const TextStyle(
                                        fontSize: 17,
                                        color: Colors.black45,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      product.price,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    const SizedBox(height: 5),
                                  ],
                                ),
                              ),
                              Positioned(
                                right: 10,
                                bottom: 5,
                                child: RawMaterialButton(
                                  onPressed: () {},
                                  constraints: const BoxConstraints(minWidth: 0),
                                  shape: const CircleBorder(),
                                  padding: const EdgeInsets.all(5),
                                  fillColor: primary,
                                  child: const Icon(
                                    Icons.add,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
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
    );
  }

  SizedBox categorySelection() {
    return SizedBox(
      height: SizeConfig.verticalSize * 7.5,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoriesList.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.only(
                left: index == 0 ? 20 : 0,
                right: 20,
              ),
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor:
                      selectedIndex == index ? primary : Colors.grey[200],
                ),
                onPressed: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Text(
                  categoriesList[index].title,
                  style: TextStyle(
                    fontSize: 18,
                    color: selectedIndex == index ? Colors.white : textGray,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
