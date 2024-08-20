import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example/Flutter%20UI/Plant%20Shop%20App%20UI/Model/plant_model.dart';

class DetailScreen extends StatelessWidget {
  final Product product;
  const DetailScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              // for arrow back and shopping cart
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 18,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.arrow_back,
                        size: 30,
                      ),
                    ),
                    const Icon(
                      Icons.shopping_cart_rounded,
                      opticalSize: 30,
                    ),
                  ],
                ),
              ),
              // for product image and it's base

              productImage(),
              const SizedBox(height: 15),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 18, top: 28),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  child: productDetails(),
                ),
              ),
            ],
          )),
    );
  }

  Widget productImage() {
    return Stack(
      children: [
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 45,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: const BorderRadius.all(
                  Radius.elliptical(300, 45),
                ),
              ),
            ),
          ),
        ),
        // for image
        Center(
          child: Hero(
            tag: product.image,
            child: Image.asset(
              product.image,
              width: 320,
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );
  }

  Widget productDetails() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const Row(
          children: [
            SizedBox(
              width: 45,
              child: Divider(
                color: Colors.black,
                thickness: 3,
              ),
            ),
            SizedBox(width: 10),
            Text(
              "Best chice",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              product.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                  color: Colors.green),
              child: Text(
                "\$${product.price}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),
        const Text(
          "About",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.only(
            right: 15,
          ),
          child: Text(
            product.description,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        const SizedBox(height: 50),
        Row(
          children: [
            Row(
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 15),
                const Text(
                  "1",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const SizedBox(width: 15),
                OutlinedButton(
                  onPressed: () {},
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 75,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: Colors.green),
                child: const Text(
                  "Buy",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
