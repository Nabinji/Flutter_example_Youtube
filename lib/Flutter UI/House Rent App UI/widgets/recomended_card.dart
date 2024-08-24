import 'package:flutter/material.dart';
import '../Utils/colors.dart';
import '../Model/house_model.dart';

class RecommendedCard extends StatelessWidget {
  final HouseRoom room;
  const RecommendedCard({super.key, required this.room});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(left: 18.0, bottom: 8.0),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(40.0),
            child: Hero(
              tag: room.image,
              child: Image.asset(
                room.image,
                fit: BoxFit.cover,
                width: 250.0,
                height: 220.0,
              ),
            ),
          ),
          Container(
            width: 250.0,
            height: 140.0,
            padding: const EdgeInsets.only(top: 15, left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  room.name,
                  maxLines: 2,
                  style: const TextStyle(
                    height: 1.2,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  room.place,
                  maxLines: 2,
                  style: const TextStyle(color: kFontColor),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "\$${room.price}.00",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: kBlueTextColor,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 41.0,
                      height: 40.0,
                      decoration:  BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red.withOpacity(0.5),
                            blurRadius: 10.0,
                            spreadRadius: 0.1,
                            offset:const Offset(0, 5),
                          )
                        ],
                      ),
                      child: Icon(
                        Icons.bookmark,
                        color: kBackgroundColor,
                        size: 20.0,
                      ),
                    ),
                    const SizedBox(
                      width: 40,
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
