import 'package:flutter/material.dart';
import 'package:flutter_example/Flutter%20UI/House%20Rent%20App%20UI/Model/house_model.dart';
import 'package:flutter_example/Flutter%20UI/House%20Rent%20App%20UI/Utils/colors.dart';

class PopularPlaceItems extends StatelessWidget {
  final HouseRoom houseRoom;
  const PopularPlaceItems({super.key, required this.houseRoom});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Stack(
              children: [
                // for image
                Positioned(
                  top: 0,
                  right: 12,
                  left: 0,
                  bottom: 12,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      houseRoom.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // for rating
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    color: houseRoom.color,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 2,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: kBackgroundColor,
                            size: 15,
                          ),
                          const SizedBox(width: 3),
                          Text(
                            houseRoom.rating,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    houseRoom.name,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    houseRoom.place,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: kFontColor.withOpacity(0.6),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "${houseRoom.width}ft | ${houseRoom.height}ft",
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black54,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "\$ ${houseRoom.price}.00",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: kBlueTextColor,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
