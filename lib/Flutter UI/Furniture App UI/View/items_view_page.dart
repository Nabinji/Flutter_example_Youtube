import 'package:flutter/material.dart';
import 'package:flutter_example/Flutter%20UI/Furniture%20App%20UI/View/items_detail_page.dart';
import 'package:flutter_example/Flutter%20UI/Furniture%20App%20UI/models/furniture_model.dart';
import 'package:flutter_example/Flutter%20UI/Furniture%20App%20UI/utils/colors.dart';

class ItemsViewPage extends StatefulWidget {
  final CollectionModel collectionModel;
  const ItemsViewPage({super.key, required this.collectionModel});

  @override
  State<ItemsViewPage> createState() => _ItemsViewPageState();
}

class _ItemsViewPageState extends State<ItemsViewPage> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final modelData = widget.collectionModel.collectionProducts[pageIndex];
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            itemCount: widget.collectionModel.collectionProducts.length,
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            onPageChanged: (value) {
              setState(() {
                pageIndex = value;
              });
            },
            itemBuilder: (context, index) {
              final collectionImage =
                  widget.collectionModel.collectionProducts[index];
              return Hero(
                tag: collectionImage.imagePath,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(collectionImage.imagePath),
                    ),
                  ),
                ),
              );
            },
          ),
          // for back button
          Align(
            alignment: Alignment.topLeft,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  margin: const EdgeInsets.only(top: 150),
                  padding: const EdgeInsets.all(15),
                  width: 220,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white70),
                  child: Center(
                    child: Text.rich(
                      TextSpan(
                          text: "${modelData.name}\n",
                          style: const TextStyle(
                            color: secondaryColor,
                            fontSize: 19,
                          ),
                          children: [
                            TextSpan(
                              text: widget.collectionModel.name,
                              style: const TextStyle(
                                  color: secondaryColor,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 60,
                  width: 100,
                  margin: const EdgeInsets.only(
                    left: 70,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: accentColor),
                  child: Center(
                    child: Text(
                      "\$${modelData.price}",
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 40,
                  width: 40,
                  margin: const EdgeInsets.only(
                    left: 80,
                  ),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: accentColor,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      extendBody: true,
      bottomNavigationBar: bottomNavBar(context),
    );
  }

  Padding bottomNavBar(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.symmetric(
        horizontal: 60,
        vertical: 16,
      ),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.home_filled,
                size: 35,
                color: Colors.white,
              ),
            ),
            GestureDetector(
              onTap: (){ 
                 Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ItemsDetailPage(
                      collectionDetailsModel: widget
                          .collectionModel.collectionProducts[pageIndex],
                    ),
                  ),
                );
              },
              child: const Icon(
                Icons.add_circle,
                size: 65,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person,
                size: 35,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
