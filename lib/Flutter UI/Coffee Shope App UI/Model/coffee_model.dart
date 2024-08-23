import 'package:flutter/material.dart';

class Coffee {
  String name, image;
  Color color;
  double price;
  double star;
  Coffee({
    required this.color,
    required this.image,
    required this.name,
    required this.price,
    required this.star
  });
}

List<Coffee> coffeelist = [
  Coffee(
    name: "Espresso",
    image: "image/coffee-shop-image/espresso.png",
    color: const Color(0xff65C5B2),
    price: 5,
    star: 4.4
  ),
  Coffee(
    name: "Cafe Mocha",
    image: "image/coffee-shop-image/Caffe_Mocha.png",
    color: const Color(0xffFFAEF2),
    price: 11,
    star: 4.9
  ),
  Coffee(
    name: "Caramel Macchiato",
    image: "image/coffee-shop-image/Caramel_Macchiato.png",
    color: const Color(0xffFF9839),
    price: 7,
    star: 4.0
  ),
  Coffee(
    name: "Turkish Coffee",
    image: "image/coffee-shop-image/turkish_Coffee.png",
    color: const Color(0xffB68456),
    price: 4,
    star: 4.3
  ),
  Coffee(
    name: "Cappuccino",
    image: "image/coffee-shop-image/cappuccino.png",
    color: const Color(0xffE74343),
    price: 9,
    star: 3.4
  ),
  Coffee(
    name: "Affogato",
    image: "image/coffee-shop-image/affogato.png",
    color: const Color(0xff56B670),
    price: 12,
    star: 4.0
  ),
  Coffee(
    name: "Cortado",
    image: "image/coffee-shop-image/cortado.png",
    color: const Color(0xff8D5FDC),
    price: 8,
    star: 5.0
  ),
  Coffee(
    name: "Cafe Cubano",
    image: "image/coffee-shop-image/cafe_cubano.png",
    color: const Color(0xff5FBFDC),
    price: 15,
    star: 4.5
  ),
];
