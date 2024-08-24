import 'package:flutter/material.dart';
import 'package:flutter_example/Flutter%20UI/House%20Rent%20App%20UI/Utils/colors.dart';
import 'package:flutter_example/Flutter%20UI/House%20Rent%20App%20UI/View/house_detail.dart';
import '../Model/house_model.dart';
import '../widgets/popular_place_card.dart';
import '../widgets/recomended_card.dart';

class HouseRentHomeScreen extends StatefulWidget {
  const HouseRentHomeScreen({super.key});

  @override
  _HouseRentHomeScreenState createState() => _HouseRentHomeScreenState();
}

class _HouseRentHomeScreenState extends State<HouseRentHomeScreen> {
  String? dropdownBeds = '2-4 Beds ';
  String? dropdownFilter = 'Short by: Price';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(155.0),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: <Widget>[
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
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 30,
                      )
                    ],
                  ),
                  trailing: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
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
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: DropdownButton(
                          value: dropdownBeds,
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            size: 25.0,
                          ),
                          underline: Container(),
                          onChanged: (String? beds) {
                            setState(() {
                              dropdownBeds = beds;
                            });
                          },
                          items: ["2-4 Beds ", "2 Beds ", "3 Beds ", "4 Beds "]
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
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14.0,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: DropdownButton(
                          value: dropdownFilter,
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            size: 25.0,
                          ),
                          underline: Container(),
                          onChanged: (String? beds) {
                            setState(() {
                              dropdownFilter = beds;
                            });
                          },
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
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 15.0),
            SizedBox(
              width: double.infinity,
              height: 370.0,
              child: ListView.builder(
                itemCount: houseList.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  var room = houseList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => RentHouseDetail(houseRoom: room),
                        ),
                      );
                    },
                    child: RecommendedCard(room: room),
                  );
                },
              ),
            ),
            const SizedBox(height: 15.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
            ),
            ListView.builder(
              itemCount: houseList.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              reverse: true,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                var room = houseList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => RentHouseDetail(houseRoom: room),
                      ),
                    );
                  },
                  child: PopularPlaceCard(room: room),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
