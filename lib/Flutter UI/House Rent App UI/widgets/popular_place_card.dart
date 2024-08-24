import 'package:flutter/material.dart';
import '../Utils/colors.dart';
import '../Model/house_model.dart';

class PopularPlaceCard extends StatelessWidget {
  final HouseRoom room;
  const PopularPlaceCard({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      height: 120.0,
      margin: const EdgeInsets.symmetric(
        horizontal: 18.0,
        vertical: 8.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 100.0,
            height: 100.0,
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Stack(
              children: <Widget>[
                // for image
                Positioned(
                  top: 0.0,
                  left: 0.0,
                  right: 12.0,
                  bottom: 12.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      room.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // for rating
                Positioned(
                  right: 0.0,
                  bottom: 0.0,
                  child: Card(
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    color: room.color,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5.0,
                        vertical: 2.0,
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            size: 15.0,
                            color: kBackgroundColor,
                          ),
                          const SizedBox(width: 3.0),
                          Text(
                            room.rating,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    room.name,
                    maxLines: 1,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    room.place,
                    style: TextStyle(
                        color: kFontColor.withOpacity(0.7),
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "${room.width}ft | ${room.height}ft",
                        maxLines: 1,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black54,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "\$ ${room.price}.00",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: kBlueTextColor,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
