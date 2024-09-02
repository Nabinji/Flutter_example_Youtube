import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import '../Utils/const.dart';
import 'detail.dart';
import '../Model/destination_model.dart';

class TravelHomePage extends StatefulWidget {
  const TravelHomePage({super.key});

  @override
  State<TravelHomePage> createState() => _TravelHomePageState();
}

class _TravelHomePageState extends State<TravelHomePage> {
  String category = 'Popular';
  int selectedPage = 0;
  List<IconData> icons = [
    Icons.home_rounded,
    Icons.location_on_outlined,
    Icons.bookmark_outline_rounded,
    Icons.settings_outlined,
  ];
  List<Destination> dataDestination = destinations;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello Sophia 👏 ',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Explore Beautiful World!',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black26,
                        ),
                      )
                    ],
                  ),
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.amber[100],
                        backgroundImage: const NetworkImage(
                            "https://static.vecteezy.com/system/resources/previews/043/473/484/non_2x/elegant-young-woman-with-a-stylish-handbag-on-transparent-background-png.png"),
                      ),
                      const Positioned(
                        right: 3,
                        top: 5,
                        child: CircleAvatar(
                          radius: 4,
                          backgroundColor: Colors.amberAccent,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search Place",
                        hintStyle: const TextStyle(
                          fontSize: 15,
                          color: Colors.black26,
                        ),
                        prefixIcon: const Icon(Icons.search, size: 30),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.all(20),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: lightblue,
                    ),
                    child: const Icon(
                      Icons.tune,
                      size: 30,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Text(
                    'Explore Cities',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        'All',
                        style: roboto.copyWith(
                          fontSize: 14,
                          color: blue,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_right_rounded,
                        color: blue,
                        size: 25,
                      )
                    ],
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 15),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                    categories.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(left: 15, right: 10),
                      child: GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              category = categories[index];
                              category == 'Popular'
                                  ? dataDestination = destinations
                                  : dataDestination = destinations
                                      .where(
                                        (element) =>
                                            element.category!.toLowerCase() ==
                                            categories[index].toLowerCase(),
                                      )
                                      .toList();
                            },
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: category == categories[index]
                                ? blue
                                : Colors.white,
                          ),
                          child: Text(
                            categories[index],
                            style: TextStyle(
                                color: category == categories[index]
                                    ? Colors.white
                                    : Colors.grey[400],
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.52,
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
                right: 60,
              ),
              child: Material(
                elevation: 0.01,
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                child: Swiper(
                  itemCount: dataDestination.length,
                  layout: SwiperLayout.STACK,
                  itemWidth: MediaQuery.of(context).size.width * 0.7,
                  axisDirection: AxisDirection.right,
                  onTap: (index) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TravelDetailPage(
                          destination: dataDestination[index],
                        ),
                      ),
                    );
                  },
                  loop: true,
                  itemBuilder: (context, index) {
                    return DestinationItem(
                      destination: dataDestination[index],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: BottomNavigationBar(
        backgroundColor: Colors.white,
        iconSize: 30,
        unselectedItemColor: Colors.black26,
        selectedItemColor: blue,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            selectedPage = value;
          });
        },
        items: [
          ...List.generate(
            icons.length,
            (index) => BottomNavigationBarItem(
                icon: Column(
                  children: [
                    const SizedBox(height: 10),
                    Icon(
                      icons[index],
                    ),
                    const SizedBox(height: 5),
                    selectedPage == index
                        ? Container(
                            height: 5,
                            width: 5,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: blue,
                            ),
                          )
                        : Container()
                  ],
                ),
                label: ''),
          ),
        ],
      ),
    );
  }
}

class DestinationItem extends StatelessWidget {
  final Destination destination;
  const DestinationItem({
    super.key,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(destination.image!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        destination.name!,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.blue[300],
                            size: 14,
                          ),
                          Text(
                            destination.location!,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.blue[300],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    SizedBox(
                      width: 300,
                      height: 25,
                      child: Stack(
                        children: [
                          Positioned(
                            left: -20,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 25,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.grey.withOpacity(0.15)),
                                ),
                                SizedBox(
                                  width: 270,
                                  child: DottedLine(
                                    dashColor: Colors.grey.withOpacity(0.4),
                                    dashGapLength: 10,
                                    dashLength: 8,
                                  ),
                                ),
                                Container(
                                  height: 25,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey.withOpacity(0.15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '\$${destination.price} / ',
                              style: roboto.copyWith(
                                fontSize: 14,
                                color: Colors.black.withOpacity(0.4),
                              ),
                            ),
                            TextSpan(
                              text: 'Person',
                              style: roboto.copyWith(
                                fontSize: 14,
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: blue.shade50,
                        ),
                        child: const Icon(
                          Icons.bookmark_outlined,
                          color: blue,
                          size: 23,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
