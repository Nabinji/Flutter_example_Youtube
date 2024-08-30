import 'package:flutter/material.dart';
import 'package:flutter_example/Flutter%20UI/Furniture%20App%20UI/models/furniture_model.dart';
import 'package:flutter_example/Flutter%20UI/Furniture%20App%20UI/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemsDetailPage extends StatelessWidget {
  final CollectionDetailsModel collectionDetailsModel;
  const ItemsDetailPage({super.key, required this.collectionDetailsModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          // final screen
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipPath(
                clipper: CurvePath(),
                child: Hero(
                  tag: collectionDetailsModel.imagePath,
                  child: Container(
                    height: 500,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(collectionDetailsModel.imagePath),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        text:
                            "${collectionDetailsModel.name.split(" ").first.toUpperCase()}\n",
                        style: GoogleFonts.antonio(
                          height: 1,
                          color: textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.123,
                        ),
                        children: [
                          TextSpan(
                            text: collectionDetailsModel.name
                                .split(" ")
                                .last
                                .toUpperCase(),
                            style: GoogleFonts.antonio(
                              height: 1,
                              color: accentColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 60,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "\$${collectionDetailsModel.price}",
                          style: GoogleFonts.antonio(
                            letterSpacing: -3,
                            color: textColor,
                            fontSize: 50,
                          ),
                        ),
                        const SizedBox(height: 40),
                        SizedBox(
                          height: 6,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 4,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                width: index == 3 ? 30 : 14,
                                margin: const EdgeInsets.only(right: 4),
                                decoration: BoxDecoration(
                                  color:
                                      index == 3 ? textColor : Colors.white24,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Text(
                  collectionDetailsModel.description,
                  style: const TextStyle(
                    color: textColor,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          // for back button
          backbutton(context),
        ],
      ),
      bottomNavigationBar: buyNowButton(),
    );
  }

  SafeArea buyNowButton() {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MaterialButton(
            height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 100),
            color: accentColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            onPressed: () {},
            child: const Text(
              "BUY NOW",
              style: TextStyle(
                color: backgroundColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: 75,
            width: 55,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.bookmark_border_outlined,
              color: Colors.grey.shade700,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }

  SafeArea backbutton(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          height: 50,
          width: 50,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor,
          ),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class CurvePath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double h = size.height;
    double w = size.width;

    Path path = Path();
    path.lineTo(0, h * 0.85);
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height,
      size.width,
      size.height * 0.85,
    );
    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
