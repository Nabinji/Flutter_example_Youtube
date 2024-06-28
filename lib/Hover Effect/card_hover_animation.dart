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
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HoverCard(
              name: 'Ellyse Perry',
              image:
                  'https://content.api.news/v3/images/bin/767ef800ed57ed5f29ad91a28d4e60ee',
              backgroundColor: Colors.pink[300]!,
              buttonColor: Colors.pink,
            ),
            HoverCard(
              name: 'Emma Grace',
              image:
                  'https://i0.wp.com/www.wonderslist.com/wp-content/uploads/2020/05/Jessica-Alba-USA.jpg?resize=662%2C373&ssl=1',
              backgroundColor: Colors.blue[300]!,
              buttonColor: Colors.blue,
            ),
            HoverCard(
              name: 'Sophia Smith',
              image:
                  'https://thumbs.dreamstime.com/b/beautiful-girl-walking-city-37813935.jpg',
              backgroundColor: Colors.purple[300]!,
              buttonColor: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}

class HoverCard extends StatefulWidget {
  final String image;
  final Color backgroundColor;
  final String name;
  final Color buttonColor;
  
  const HoverCard({
    super.key,
    required this.name,
    required this.image,
    required this.backgroundColor,
    required this.buttonColor,
  });

  @override
  State<HoverCard> createState() => _HoverCardState();
}
class _HoverCardState extends State<HoverCard> {
  bool isHovered = false; // Boolean to track if the card is hovered

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: MouseRegion(
        // MouseRegion widget to detect mouse enter and exit events
        onEnter: (event) {
          setState(() {
            isHovered = true; // Set isHovered to true when mouse enters
          });
        },
        onExit: (event) {
          setState(() {
            isHovered = false; // Set isHovered to false when mouse exits
          });
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
             // Animated container for the card background
            AnimatedContainer(
             
              duration: const Duration(milliseconds: 375),
              height: isHovered ? 300.0 : 280.0, // Change height when hovered
              width: 220.0,
              decoration: BoxDecoration(
                color: widget.backgroundColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
              // Animated positioning of the inner container
            AnimatedPositioned(
            
              duration: const Duration(milliseconds: 375),
              curve: Curves.easeOut,
              top: isHovered ? -100.0 : 0.0, // if hover Move up otherwise at original position
               // Inner container with image and text
              child: AnimatedContainer(
               
                duration: const Duration(milliseconds: 375),
                curve: Curves.easeOut,
                height: isHovered ? 400.0 : 280.0, // Change height when hovered
                width: 220.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      // Animated container for the image
                      child: AnimatedContainer(
                        
                        duration: const Duration(milliseconds: 375),
                        curve: Curves.easeOut,
                        height: isHovered ? 180.0 : 200.0, // Change size when hovered
                        width: isHovered ? 180.0 : 200.0, // Change size when hovered
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                            image: NetworkImage(widget.image),
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      // Name of the person
                      widget.name,
                      style: const TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const Text(
                                
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, \nsed do eiusmod tempor incididunt ut labore et',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15.5,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 15.0),
                                // Read More button
                              TextButton(
                              
                                style: TextButton.styleFrom(
                                  backgroundColor: widget.buttonColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  padding: const EdgeInsets.all(15),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  'Read More',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.white,
                                  ),
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
            ),
          ],
        ),
      ),
    );
  }
}
