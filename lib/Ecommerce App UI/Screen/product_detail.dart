import 'package:flutter/material.dart';
import 'package:flutter_example/Ecommerce%20App%20UI/Model/product_model.dart';
import '../Utils/colors.dart';
import '../Utils/size.dart';

class ProductDetail extends StatelessWidget {
  final Product product;
  const ProductDetail({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // for buy button
      floatingActionButton: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
        ),
        child: const Text(
          "Buy Now",
          style: TextStyle(
            fontSize: 18,
           color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
                    image: AssetImage(product.image),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 3,
                        fit: FlexFit.loose,
                        child: RawMaterialButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          constraints:
                              const BoxConstraints(minWidth: 10, maxWidth: 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          fillColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 2,
                        child: Text(
                          'Detail',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        fit: FlexFit.loose,
                        child: RawMaterialButton(
                          onPressed: () {},
                          constraints: const BoxConstraints(
                            minWidth: 10,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          fillColor: Colors.white,
                          padding: const EdgeInsets.all(10),
                          child: const Icon(
                            Icons.favorite_border,
                            color: Colors.black,
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
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 25.0),
                transform: Matrix4.translationValues(0, -30, 0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 50.0,
                        height: 6.0,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(height: SizeConfig.verticalSize * 3.5),
                    Text(
                      product.title,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
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
                            fontSize: 32,
                            color:primary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          child: Row(
                            children: [
                              RawMaterialButton(
                                constraints: const BoxConstraints(minWidth: 0),
                                onPressed: () {},
                                elevation: 0,
                                fillColor: Colors.grey[200],
                                padding: const EdgeInsets.all(5.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child:  Icon(
                                  Icons.remove,
                                  color:textGray,
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 10.0),
                              const Text(
                                "01",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 10.0),
                              RawMaterialButton(
                                constraints: const BoxConstraints(minWidth: 0),
                                elevation: 0,
                                onPressed: () {},
                                fillColor: Colors.grey[200],
                                padding: const EdgeInsets.all(5.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Icon(
                                  Icons.add,
                                  color:textGray,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: SizeConfig.verticalSize * 2),
                    Text(
                      product.description,
                      style: const TextStyle(
                        fontSize: 17,
                        color:Colors.black54,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
