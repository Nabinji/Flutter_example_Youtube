import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../consts.dart';
import '../models/product_model.dart';
import '../provider/cart_provider.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;
  const ProductItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          height: 240,
          width: MediaQuery.of(context).size.width / 2 - 35,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Container(
          height: 285,
          width: MediaQuery.of(context).size.width / 2 - 35,
          decoration: BoxDecoration(
            color: transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.rotate(
                  angle: 10 * pi / 180,
                  child: Container(
                    height: 160,
                    color: transparent,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(
                          height: 90,
                          width: 160,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 5),
                                color: black,
                                spreadRadius: 10,
                                blurRadius: 30,
                              )
                            ],
                          ),
                        ),
                        Image.asset(
                          product.image,
                          height: 150,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  product.name,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: black,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.star_rate_rounded,
                            color: yellow, size: 20),
                        const SizedBox(width: 5),
                        Text(
                          product.rate.toString(),
                          style: TextStyle(
                            color: black.withOpacity(.8),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: pink, size: 20),
                        const SizedBox(width: 5),
                        Text(
                          '150m',
                          style: TextStyle(
                            color: black.withOpacity(.8),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  '\$${(product.price).toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: () {
              cartProvider.addCart(product);
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: const Icon(
                Icons.shopping_cart_outlined,
                color: white,
                size: 24,
              ),
            ),
          ),
        )
      ],
    );
  }
}
