import 'package:flutter/material.dart';

import '../Utils/constants.dart';
import '../models/food.dart';

class FoodCategories extends StatefulWidget {
  const FoodCategories({super.key});

  @override
  State<FoodCategories> createState() => _CategoriesState();
}

class _CategoriesState extends State<FoodCategories> {
  int selectedIndex = 0;
  String category = "All";
  List<Food> myFood = foods;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          catgories.length,
          (index) => GestureDetector(
            onTap: () {
              setState(() {
                category = catgories[index];
                category == "All"
                    ? myFood = foods
                    : myFood = foods
                        .where(
                          (element) =>
                              element.category.toLowerCase() ==
                              catgories[index].toLowerCase(),
                        )
                        .toList();
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color:
                    category == catgories[index] ? kprimaryColor : Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              margin: const EdgeInsets.only(right: 20),
              child: Text(
                catgories[index],
                style: TextStyle(
                  color: category == catgories[index]
                      ? Colors.white
                      : Colors.grey.shade600,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
