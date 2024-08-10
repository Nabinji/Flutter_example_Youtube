import 'package:flutter/material.dart';
import '../Model/plant_model.dart';

class DetailPage extends StatelessWidget {
  final Product product;
  const DetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // arrow back and shopping cart
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
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
                    size: 30,
                  )
                ],
              ),
            ),
            // product image and it's base
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
                  child: productDetails()),
            ),
          ],
        ),
      ),
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
                  Radius.elliptical(300, 50),
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Image.asset(
            product.image,
            height: 320,
            fit: BoxFit.cover,
          ),
        ),
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
              width: 48,
              child: Divider(
                thickness: 3,
                color: Colors.black,
              ),
            ),
            SizedBox(width: 8),
            Text(
              'Best choice',
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              product.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
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
                ' \$${product.price}',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )
          ],
        ),
        const SizedBox(height: 25),
        const Text(
          'About',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.only(right: 14),
          child: Text(
            product.description,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        const SizedBox(height: 50),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              OutlinedButton(
                onPressed: () {},
                child: const Icon(Icons.remove),
              ),
              const SizedBox(width: 15),
              const Text(
                '1',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(width: 15),
              OutlinedButton(
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 75,
                vertical: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: Colors.green,
              ),
              child: const Center(
                child: Text(
                  "Buy",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ]),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
