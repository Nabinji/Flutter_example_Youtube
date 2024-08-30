import 'package:flutter/material.dart';
import 'package:flutter_example/Flutter%20UI/Furniture%20App%20UI/View/items_view_page.dart';
import 'package:flutter_example/Flutter%20UI/Furniture%20App%20UI/models/furniture_model.dart';
import 'package:flutter_example/Flutter%20UI/Furniture%20App%20UI/utils/colors.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class FurnitureHomePage extends StatefulWidget {
  const FurnitureHomePage({super.key});

  @override
  State<FurnitureHomePage> createState() => _FurnitureHomePageState();
}

class _FurnitureHomePageState extends State<FurnitureHomePage> {
  int selectedIndex = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/furniture-image/menu-icon.png",
                        height: 30,
                      ),
                      Image.asset("assets/furniture-image/search.png",
                          height: 30),
                    ],
                  ),
                  Positioned(
                    left: 50,
                    top: -10,
                    child: Text.rich(
                      TextSpan(
                          text: "NEW\n",
                          style: GoogleFonts.antonio(
                            color: accentColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 45,
                          ),
                          children: [
                            TextSpan(
                              text: "COLLECTION\n",
                              style: GoogleFonts.antonio(
                                height: 0.6,
                                color: textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 45,
                              ),
                            )
                          ]),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 85),
              const Text.rich(
                TextSpan(
                    text:
                        "The new Flexform outdoor collection is permeated with fresh, inventive style and pioneering design",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                    children: [
                      TextSpan(
                        text: "Read more",
                        style: TextStyle(
                          color: Colors.grey,
                          overflow: TextOverflow.ellipsis,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.grey,
                          fontSize: 20,
                        ),
                      )
                    ]),
              ),
              const SizedBox(height: 30),
              categorySelection(),
              Expanded(
                child: MasonryGridView.builder(
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 10,
                    itemCount: mockData.length,
                    gridDelegate:
                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      final items = mockData[index];
                      return furnitureItems(context, items);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector furnitureItems(BuildContext context, CollectionModel items) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ItemsViewPage(collectionModel: items),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  Hero(
                    tag: items.imagePath,
                    child: Image.asset(items.imagePath),
                  ),
                  Positioned(
                      top: 15,
                      right: 15,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: const Icon(
                          Icons.bookmark_outline_sharp,
                          size: 30,
                          color: Colors.black45,
                        ),
                      ))
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${items.name.split(" ").first}\n${items.name.split(" ").last}",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    height: 1.1,
                  ),
                ),
                Text(
                  "\$${items.price}",
                  style: GoogleFonts.antonio(
                    letterSpacing: -1,
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  SizedBox categorySelection() {
    return SizedBox(
      height: 60,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: furnitureCategory.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20, left: 10),
                    child: Text(
                      furnitureCategory[index],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: selectedIndex == index
                            ? Colors.amber
                            : Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                selectedIndex == index
                    ? Container(
                        height: 5,
                        width: 15,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      )
                    : Container(),
              ],
            );
          }),
    );
  }
}
