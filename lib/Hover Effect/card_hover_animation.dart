import 'package:flutter/material.dart';

class CardHoverAnimation extends StatefulWidget {
  const CardHoverAnimation({super.key});

  @override
  State<CardHoverAnimation> createState() => _CardHoverAnimationState();
}

class _CardHoverAnimationState extends State<CardHoverAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CardHover(
              name: "Ellyse Perry",
              backgroundColor: Colors.pink[300]!,
              buttonColor: Colors.pink,
              image: "https://content.api.news/v3/images/bin/767ef800ed57ed5f29ad91a28d4e60ee",
            ),
             CardHover(
              name: "Emma Grace",
              backgroundColor: Colors.blue[300]!,
              buttonColor: Colors.blue,
              image: "https://thumbs.dreamstime.com/b/beautiful-girl-walking-city-37813935.jpg",
            ),
             CardHover(
              name: "Sophia Smith",
              backgroundColor: Colors.purple[300]!,
              buttonColor: Colors.purple,
              image: "https://i0.wp.com/www.wonderslist.com/wp-content/uploads/2020/05/Jessica-Alba-USA.jpg?resize=662%2C373&ssl=1",
            ),
          ],
        ),
      ),
    );
  }
}

class CardHover extends StatefulWidget {
  final Color backgroundColor;
  final String name;
  final String image;
  final Color buttonColor;
  const CardHover({
    super.key,
    required this.backgroundColor,
    required this.name,
    required this.image,
    required this.buttonColor,
  });

  @override
  State<CardHover> createState() => _CardHoverState();
}

class _CardHoverState extends State<CardHover> {
  bool isHovered = false; // Boolean to track if the card is hovered or not
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: MouseRegion(
        // MouseRegion widget to detect mouse eneter and exit events
        onEnter: (event) {
          setState(() {
            isHovered = true; // set isHovered to true when mouse enters
          });
        },
        onExit: (event) {
          setState(() {
            isHovered = false; // set isHovered to false when  mouse exits
          });
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            //Animated container for the card background
            AnimatedContainer(
              duration: const Duration(milliseconds: 350),
              height: isHovered
                  ? 300
                  : 280, // change height from 280 to 300 if hover
              width: 220,
              decoration: BoxDecoration(
                color: widget.backgroundColor,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            // Animated positioning of the inner container
            AnimatedPositioned(
              duration: const Duration(milliseconds: 350),
              top: isHovered
                  ? -100
                  : 0, // if hover then move up to 100 otherwise at original position
              // inner container for image and text
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 350),
                height: isHovered ? 400 : 280, // change the height when hovered
                width: 220,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // for image
                    Padding(
                      padding: const EdgeInsets.all(10),
                      // animated container for the image
                      child: AnimatedContainer(
                        duration: const Duration(microseconds: 350),
                        height: isHovered ? 180 : 200,
                        width: isHovered ? 180 : 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(
                              widget.image,
                            ),
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                      ),
                    ),

                    // for name
                    const SizedBox(height: 10),
                    Text(
                      widget.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                      const SizedBox(height: 9),
                    //  for some info
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const Text(
                              " Lorem ipsum dolor sit amet, consectetur adipiscing elit, \nsed do eiusmod tempor incididunt ut labore et",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 15),
                            // for read more button
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: widget.buttonColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.all(15),
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Read more",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
