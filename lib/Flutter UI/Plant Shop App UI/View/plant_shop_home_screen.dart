import 'package:flutter/material.dart';
import 'package:flutter_example/Flutter%20UI/Plant%20Shop%20App%20UI/Model/plant_model.dart';
import 'package:flutter_example/Flutter%20UI/Plant%20Shop%20App%20UI/View/product_detail.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class PlantShopHomeScreen extends StatefulWidget {
  const PlantShopHomeScreen({super.key});

  @override
  State<PlantShopHomeScreen> createState() => _PlantShopHomeScreenState();
}

class _PlantShopHomeScreenState extends State<PlantShopHomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // for welcome text and cart
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Welcome to ",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.shopping_cart_rounded,
                  size: 30,
                )
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              "Plant Shop",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            // for search bar and filter button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Row(
                children: [
                  searchField(),
                  const SizedBox(width: 10),
                  shortItemsButton(),
                ],
              ),
            ),
            // for category selection
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                shopCategoryItems(
                  title: "POPULAR",
                  isActive: true,
                ),
                shopCategoryItems(title: "ORGANIC"),
                shopCategoryItems(title: "INDOORS"),
                shopCategoryItems(title: "SYNTHETIC"),
              ],
            ),
            const SizedBox(height: 25),
            Expanded(
              child: StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                mainAxisSpacing: 22,
                crossAxisSpacing: 22,
                itemCount: product.length,
                itemBuilder: (context, index) {
                  final shopProduct = product[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            product: product[index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.withOpacity(0.15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              // for image base,
                              Stack(
                                children: [
                                  Positioned.fill(
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        height: 20,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade300,
                                          borderRadius: const BorderRadius.all(
                                            Radius.elliptical(100, 25),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // for image
                                  Center(
                                    child: Hero(
                                      tag: shopProduct.image,
                                      child: Image.asset(
                                        shopProduct.image,
                                        width: 200,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              // for favorite icon
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    shopProduct.isFavorited =
                                        !shopProduct.isFavorited;
                                  });
                                },
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: shopProduct.isFavorited
                                          ? Colors.pink.shade50
                                          : Colors.grey.shade400,
                                    ),
                                    child: Icon(
                                      Icons.favorite,
                                      color: shopProduct.isFavorited
                                          ? Colors.pink
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // for product name
                          const SizedBox(height: 5),
                          Text(
                            shopProduct.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // product price
                              Text(
                                "\$${shopProduct.price}",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: selectedIndex == index
                                      ? Colors.green
                                      : Colors.grey.shade400,
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
                staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchField() {
    return Expanded(
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search",
          prefixIcon: const Icon(
            Icons.search,
            size: 30,
          ),
          filled: true,
          fillColor: Colors.grey.shade200,
          contentPadding: const EdgeInsets.all(15),
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
    );
  }

  Widget shortItemsButton() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(15),
      ),
      child: const RotatedBox(
        quarterTurns: 4,
        child: Icon(
          Icons.tune,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  Widget shopCategoryItems({
    bool isActive = false,
    required String title,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: isActive ? Colors.green : Colors.grey,
              fontWeight: FontWeight.bold),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          height: 4,
          width: 30,
          decoration: isActive
              ? BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(10))
              : const BoxDecoration(),
        ),
      ],
    );
  }
}
