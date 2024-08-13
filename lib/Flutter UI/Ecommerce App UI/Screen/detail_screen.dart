import 'package:flutter/material.dart';
import 'package:flutter_example/Flutter%20UI/Ecommerce%20App%20UI/Model/product_model.dart';
import 'package:flutter_example/Flutter%20UI/Ecommerce%20App%20UI/Utils/colors.dart';
import 'package:flutter_example/Flutter%20UI/Ecommerce%20App%20UI/Utils/size.dart';

class ProductDetail extends StatelessWidget {
  final Product product;
  const ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // for buy button
      floatingActionButton: buyButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SizedBox(
        child: Column(
          children: [
            Hero(
              tag: product.image,
              child: Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.only(top: 50),
                height: SizeConfig.screenHeight / 1.7,
                width: SizeConfig.screenWidth,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        product.image,
                      ),
                      fit: BoxFit.cover),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 3,
                        child: RawMaterialButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          constraints:
                              const BoxConstraints(minWidth: 10, maxWidth: 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fillColor: Colors.white,
                          padding: const EdgeInsets.all(10),
                          child: const Icon(
                            Icons.arrow_back_ios,
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 2,
                        child: Text(
                          "Detail",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: RawMaterialButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          constraints:
                              const BoxConstraints(minWidth: 10, maxWidth: 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fillColor: Colors.white,
                          padding: const EdgeInsets.all(10),
                          child: const Icon(
                            Icons.favorite_border,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                transform: Matrix4.translationValues(0, -30, 0),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 50,
                        height: 6,
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.verticalSize * 3.5,
                    ),
                    Text(
                      product.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.verticalSize * 2.5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.price,
                          style: TextStyle(
                            color: primary,
                            fontWeight: FontWeight.w800,
                            fontSize: 32,
                          ),
                        ),
                        SizedBox(
                          child: Row(
                            children: [
                              RawMaterialButton(
                                onPressed: () {},
                                constraints: const BoxConstraints(minWidth: 0),
                                fillColor: Colors.grey[200],
                                padding: const EdgeInsets.all(5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Icons.remove,
                                  color: textGray,
                                ),
                              ),
                              const Text(
                                "01",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              RawMaterialButton(
                                onPressed: () {},
                                constraints: const BoxConstraints(minWidth: 0),
                                fillColor: Colors.grey[200],
                                padding: const EdgeInsets.all(5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: textGray,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.verticalSize * 2,
                    ),
                    Text(
                      product.description,
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton buyButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
      onPressed: () {},
      child: const Text(
        "Buy Now",
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }
}
