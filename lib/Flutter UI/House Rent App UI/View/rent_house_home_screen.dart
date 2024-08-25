import 'package:flutter/material.dart';
import 'package:flutter_example/Flutter%20UI/House%20Rent%20App%20UI/Model/house_model.dart';

import 'package:flutter_example/Flutter%20UI/House%20Rent%20App%20UI/Utils/colors.dart';
import 'package:flutter_example/Flutter%20UI/House%20Rent%20App%20UI/View/Widget/horizontal_scroll.dart';
import 'package:flutter_example/Flutter%20UI/House%20Rent%20App%20UI/View/Widget/popular_place.dart';
import 'package:flutter_example/Flutter%20UI/House%20Rent%20App%20UI/View/house_rent_detail.dart';

class HouseRentHomeScreen extends StatefulWidget {
  const HouseRentHomeScreen({super.key});

  @override
  State<HouseRentHomeScreen> createState() => _HouseRentHomeScreenState();
}

class _HouseRentHomeScreenState extends State<HouseRentHomeScreen> {
  String? dropdownBeds = "2-4 Beds ";
  String? dropdownFilter = "Short by: Price";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(155),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: topBarItems(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 370,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: houseList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => HouseRentDetail(
                            houseRoom: houseList[index],
                          ),
                        ),
                      );
                    },
                    child: DisplayItemsHorizontal(
                      houseRoom: houseList[index],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 15),
            popularPlace(),
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              reverse: true,
              physics: const ScrollPhysics(),
              itemCount: houseList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => HouseRentDetail(
                          houseRoom: houseList[index],
                        ),
                      ),
                    );
                  },
                  child: PopularPlaceItems(
                    houseRoom: houseList[index],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Padding popularPlace() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          title: const Text(
            "Popular Place",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 25,
            ),
          ),
          trailing: Text(
            "View All",
            style: TextStyle(
              fontSize: 15,
              decoration: TextDecoration.underline,
              decorationColor: kFontColor.withOpacity(0.7),
              color: kFontColor.withOpacity(0.7),
            ),
          ),
        ),
      ),
    );
  }

  Column topBarItems() {
    return Column(
      children: [
        ListTile(
          title: const Text(
            "My Location",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: kFontColor,
            ),
          ),
          subtitle: const Row(
            children: [
              Text(
                "Surkhet, Nepal ",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                size: 30,
              ),
            ],
          ),
          trailing: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: const Icon(
              Icons.notifications,
              size: 30,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 13,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: DropdownButton(
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    size: 25,
                  ),
                  underline: Container(),
                  value: dropdownBeds,
                  items: ["2-4 Beds ", "2 Beds ", "1 Beds ", "4 Beds "]
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (String? beds) {
                    setState(() {
                      dropdownBeds = beds;
                    });
                  },
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 13,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: DropdownButton(
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    size: 25,
                  ),
                  underline: Container(),
                  value: dropdownFilter,
                  items: [
                    "Short by: Price",
                    "Short by: Name",
                    "Short by: Location",
                    "Short by: Type",
                  ]
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (String? beds) {
                    setState(() {
                      dropdownFilter = beds;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
