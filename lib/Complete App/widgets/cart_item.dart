import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../consts.dart';
import '../models/cart_model.dart';
import '../provider/cart_provider.dart';

class CartItem extends StatelessWidget {
  final CartModel cart;
  const CartItem({
    super.key,
    required this.cart,
  });

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Container(
      height: 130,
      width: MediaQuery.of(context).size.width - 50,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: black.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 5,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 130,
            width: MediaQuery.of(context).size.width - 50,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Positioned(
            top: -5,
            left: 0,
            child: Transform.rotate(
              angle: 10 * pi / 180,
              child: SizedBox(
                width: 130,
                height: 130,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      height: 130,
                      width: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: black.withOpacity(0.8),
                            blurRadius: 30,
                            spreadRadius: 10,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      cart.productModel.image,
                      width: 130,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 150,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cart.productModel.name,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: black,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.star_rate_rounded,
                            color: yellow, size: 20),
                        const SizedBox(width: 5),
                        Text(
                          cart.productModel.rate.toString(),
                          style: TextStyle(color: black.withOpacity(.8)),
                        ),
                      ],
                    ),
                    const SizedBox(width: 15),
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: pink, size: 20),
                        const SizedBox(width: 5),
                        Text(
                          '150m',
                          style: TextStyle(color: black.withOpacity(.8)),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$${(cart.productModel.price).toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (cart.quantity > 1) {
                              cartProvider.reduceQuantity(cart.productModel);
                            }
                          },
                          child: Container(
                            width: 25,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: black,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(7),
                              ),
                            ),
                            child: const Icon(
                              Icons.remove,
                              color: white,
                              size: 20,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          cart.quantity.toString(),
                          style: const TextStyle(
                            color: black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            cartProvider.addCart(cart.productModel);
                          },
                          child: Container(
                            width: 25,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: black,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(7),
                              ),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: white,
                              size: 20,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
