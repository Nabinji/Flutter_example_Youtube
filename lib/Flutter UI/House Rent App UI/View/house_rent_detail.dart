import 'package:flutter/material.dart';
import 'package:flutter_example/Flutter%20UI/House%20Rent%20App%20UI/Model/house_model.dart';
import 'package:flutter_example/Flutter%20UI/House%20Rent%20App%20UI/Utils/colors.dart';

class HouseRentDetail extends StatelessWidget {
  final HouseRoom houseRoom;
  const HouseRentDetail({super.key, required this.houseRoom});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Hero(
                  tag: houseRoom.image,
                  child: Image.asset(
                    houseRoom.image,
                    fit: BoxFit.cover,
                    height: size.height * 0.43,
                    width: size.width,
                  ),
                ),
              ),
              // for back button
              Positioned(
                top: 40,
                right: 20,
                left: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const InkWell(
                        child: Icon(
                          Icons.more_vert,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // for price
              Positioned(
                bottom: -30,
                left: 20,
                child: Container(
                  height: 60,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "\$ ${houseRoom.price}.00/M",
                      style: const TextStyle(
                        color: kBlueTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
              // for bookmark icon
              Positioned(
                bottom: -120,
                right: 50,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.red.withOpacity(0.8),
                            blurRadius: 10,
                            offset: const Offset(0, 5))
                      ]),
                  child: Icon(
                    Icons.bookmark,
                    color: kBackgroundColor,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.03),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    houseRoom.name,
                    maxLines: 2,
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 30,
                      height: 1.2,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  houseRoom.place,
                  style: TextStyle(
                    height: 1.2,
                    color: kFontColor.withOpacity(0.7),
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    "Room Facilities",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      height: 2,
                    ),
                  ),
                  Text(
                    "Too much work. Let's burn it and say we dumped it in the sewer. Oh, I don't have time for this. I have to go",
                    style: TextStyle(
                      fontSize: 15,
                      color: kFontColor.withOpacity(0.7),
                    ),
                  ),
                  const Text(
                    "Read More",
                    style: TextStyle(
                      fontSize: 18,
                      height: 2,
                      fontWeight: FontWeight.w500,
                      color: kBlueTextColor,
                      decoration: TextDecoration.underline,
                      decorationColor: kBlueTextColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      roomInfo("image/house-rent/icon1.png", houseRoom.height),
                      roomInfo("image/house-rent/icon2.png", houseRoom.width),
                      roomInfo("image/house-rent/icon3.png",
                          "${houseRoom.bath} Baths"),
                      roomInfo("image/house-rent/icon4.png", houseRoom.type),
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                  Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      color: const Color(0xff002140),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.all(22),
                        child: Text(
                          "Book The Appartment",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container roomInfo(image, value) {
    return Container(
      height: 100,
      width: 80,
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 40,
          ),
          const SizedBox(height: 7),
          Text(value)
        ],
      ),
    );
  }
}
