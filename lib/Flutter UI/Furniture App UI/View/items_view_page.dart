import 'package:flutter/material.dart';

import '../models/furniture_model.dart';
import '../utils/colors.dart';
import 'items_detail_page.dart';

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
            onPageChanged: (val) {
              setState(() {
                pageIndex = val;
              });
            },
            itemBuilder: ((context, index) {
              final collectImg =
                  widget.collectionModel.collectionProducts[index];
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(collectImg.imagePath),
                    fit: BoxFit.fill,
                  ),
                ),
              );
            }),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
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
                  duration: const Duration(milliseconds: 375),
                  margin: const EdgeInsets.only(top: 150),
                  padding: const EdgeInsets.all(15),
                  width: 220,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white70),
                  child: Center(
                    child: Text.rich(
                      TextSpan(
                        text:
                            "${modelData.name}\n",
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
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 60,
                  width: 100,
                  margin: const EdgeInsets.only(left: 70),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: accentColor),
                  child: Center(
                    child: Text(
                      "\$${modelData.price}",
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  height: 35,
                  width: 35,
                  margin: const EdgeInsets.only(left: 80),
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: accentColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 16.0),
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
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.home_filled,
                  color: Colors.white,
                ),
              ),
              FloatingActionButton(
                backgroundColor: Colors.white,
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ItemsDetailPage(
                      product:
                          widget.collectionModel.collectionProducts[pageIndex],
                    ),
                  ),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
