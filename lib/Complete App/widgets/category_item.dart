import 'package:flutter/material.dart';

import '../consts.dart';
import '../models/category_model.dart';

class CategoryItem extends StatelessWidget {
  final bool selected;
  final Category category;
  const CategoryItem({
    super.key,
    required this.category,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      height: 105,
      width: 78,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10),
        border: selected
            ? Border.all(width: 2, color: orange)
            : Border.all(color: white),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                height: 30,
                width: 46,
                decoration:
                    const BoxDecoration(shape: BoxShape.circle, boxShadow: [
                  BoxShadow(
                    color: black,
                    offset: Offset(0, 10),
                    blurRadius: 10,
                    spreadRadius: 6,
                  )
                ]),
              ),
              Image.asset(
                category.image,
                width: 46,
                fit: BoxFit.contain,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            category.name,
            style: roboto.copyWith(fontSize: 14, color: black),
          )
        ],
      ),
    );
  }
}
