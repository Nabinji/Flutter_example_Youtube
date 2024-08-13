import 'package:flutter/material.dart';

import '../Model/universe_model.dart';
import '../Utils/colors.dart';

class PlanetDetailPage extends StatefulWidget {
  final PlanetInfo planetInfo;
  const PlanetDetailPage({super.key, required this.planetInfo});

  @override
  State<PlanetDetailPage> createState() => _PlanetDetailPageState();
}

class _PlanetDetailPageState extends State<PlanetDetailPage> {
  bool _isExpandText = false;
  void toggleExpanded() {
    setState(() {
      _isExpandText =
          !_isExpandText; // first click expand second click back to same position
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 280),
                        Text(
                          widget.planetInfo.name,
                          style: TextStyle(
                            fontSize: 60,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          "Solar System",
                          style: TextStyle(
                            fontSize: 35,
                            color: primaryTextColor,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Divider(color: Colors.black12),
                        const SizedBox(height: 20),
                        Text(
                          widget.planetInfo.description,
                          maxLines: _isExpandText ? null : 5,
                          overflow: _isExpandText
                              ? TextOverflow.visible
                              : TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 20,
                            color: contentTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        GestureDetector(
                          onTap: toggleExpanded,
                          child: Text(
                            _isExpandText ? "Read less" : "Read more",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.amber,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Divider(color: Colors.black12),
                      ],
                    ),
                  ),
                  Text(
                    "    Gallery",
                    style: TextStyle(
                      fontSize: 25,
                      color: primaryTextColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: SizedBox(
                      height: 250,
                      child: ListView.builder(
                        itemCount: widget.planetInfo.images.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Image.network(
                                widget.planetInfo.images[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: -50,
              child: Hero(
                tag: widget.planetInfo.id,
                child: Image.asset(
                  widget.planetInfo.iconImage,
                ),
              ),
            ),
            Positioned(
              child: Text(
                widget.planetInfo.id.toString(),
                style: TextStyle(
                  fontSize: 250,
                  color: primaryTextColor.withOpacity(
                    0.1,
                  ),
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
              ),
            )
          ],
        ),
      ),
    );
  }
}
