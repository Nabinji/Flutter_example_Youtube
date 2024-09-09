import 'package:flutter/material.dart';
import 'package:flutter_example/Flutter%20UI/Real%20Estate%20App%20UI/Model/real_estate_model.dart';
import 'package:flutter_example/Flutter%20UI/Real%20Estate%20App%20UI/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'real_estate_detail.dart';

class RealEstateHomeScreen extends StatefulWidget {
  const RealEstateHomeScreen({super.key});

  @override
  _RealEstateHomeScreenState createState() => _RealEstateHomeScreenState();
}

class _RealEstateHomeScreenState extends State<RealEstateHomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryBackground,
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: size.width,
              height: size.height,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    // header parts
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.shade200),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.menu,
                              size: 30,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Current Location",
                              style: TextStyle(
                                  color: Colors.grey.shade500, fontSize: 15),
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.location_on_sharp,
                                  color: Colors.blue,
                                  size: 20,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Melbourne, Aus",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17),
                                )
                              ],
                            ),
                          ],
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.shade200),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.tune,
                              color: Colors.black54,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //Search bar
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search for dream home",
                          hintStyle: const TextStyle(color: Colors.black26),
                          prefixIcon: const Icon(Icons.search),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    //Banner
                    Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 110,
                          decoration: BoxDecoration(
                            color: bannerColor1,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      " GET YOUR 10% \n CASHBACK",
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                          fontSize: 20),
                                      textAlign: TextAlign.start,
                                    ),
                                    Text(
                                      "*Expired 20 Dec 2022",
                                      style: GoogleFonts.montserrat(
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          right: -10,
                          top: -15,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: bannerColor2,
                          ),
                        ),
                        Positioned(
                          right: -30,
                          child: Image.network(
                            "https://r2.erweima.ai/imgcompressed/compressed_0ce6b73ab0ec56a5fc2d433f2fd2a509.webp",
                            height: 200,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                    //List
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: realEstateModel.length,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        final house = realEstateModel[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => RealEstateDetail(
                                  house: house,
                                ),
                              ),
                            );
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 290,
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 210,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: NetworkImage(house.image),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 15,
                                      left: 15,
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "\$${house.price}",
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const TextSpan(
                                                text: "/month",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black54,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          house.name,
                                          style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.location_on_outlined,
                                              size: 15,
                                              color: Colors.grey.shade500,
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              house.place,
                                              style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey.shade500,
                                                  fontSize: 16),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 45,
                                      width: 45,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.grey.shade200,
                                          width: 1,
                                        ),
                                      ),
                                      child: Transform.rotate(
                                        angle: -45,
                                        child:const Icon(
                                          Icons.arrow_downward,size: 30,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: -30,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: BottomNavigationBar(
                    showUnselectedLabels: false,
                    showSelectedLabels: false,
                    selectedItemColor: Colors.white,
                    unselectedItemColor: Colors.grey,
                    selectedFontSize: 0,
                    unselectedFontSize: 0,
                    iconSize: 30,
                    backgroundColor: Colors.black,
                    type: BottomNavigationBarType.fixed,
                    currentIndex: _currentIndex,
                    onTap: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: "",
                        backgroundColor: Colors.black,
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.search),
                        label: "",
                        backgroundColor: Colors.black,
                      ),
                      BottomNavigationBarItem(
                        label: "",
                        backgroundColor: Colors.black,
                        icon: Icon(Icons.favorite),
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        label: "",
                        backgroundColor: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
