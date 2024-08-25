import 'package:flutter/material.dart';
import 'package:flutter_example/Flutter%20UI/House%20Rent%20App%20UI/Model/house_model.dart';
import 'package:flutter_example/Flutter%20UI/House%20Rent%20App%20UI/Utils/colors.dart';

class DisplayItemsHorizontal extends StatelessWidget {
  final HouseRoom houseRoom;
  const DisplayItemsHorizontal({super.key, required this.houseRoom});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(left: 18, bottom: 8),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Hero(
              tag: houseRoom.image,
              child: Image.asset(
                houseRoom.image,
                fit: BoxFit.cover,
                height: 220,
                width: 250,
              ),
            ),
          ),
          Container(
            height: 140,
            width: 250,
            padding: const EdgeInsets.only(
              top: 15,
              left: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  houseRoom.name,
                  maxLines: 2,
                  style: const TextStyle(
                    height: 1.2,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  houseRoom.place,
                  maxLines: 2,
                  style: const TextStyle(
                    color: kFontColor,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "\$ ${houseRoom.price}.00",
                      style: const TextStyle(
                        fontSize: 22,
                        color: kBlueTextColor,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 41,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red.withOpacity(0.5),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.bookmark,
                        color: kBackgroundColor,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 20),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
