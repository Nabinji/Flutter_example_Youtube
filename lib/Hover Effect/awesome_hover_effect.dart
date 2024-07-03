import 'package:flutter/material.dart';

class AwesomeHoverEffect extends StatefulWidget {
  const AwesomeHoverEffect({super.key});

  @override
  _AwesomeHoverEffectState createState() => _AwesomeHoverEffectState();
}

class _AwesomeHoverEffectState extends State<AwesomeHoverEffect> {
  bool isHover = false; // initial isHover is false
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MouseRegion(
          onEnter: (event) {
            setState(() {
              isHover = true; // set isHovered to true when mouse enters
            });
          },
          onExit: (event) {
            setState(() {
              isHover = false; // set isHovered to false when mouse exit
            });
          },
          child: Container(
            height: 400,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Stack(
              children: [
                // Display text or logo based on hover state
                Positioned(
                  left: 30,
                  top: 190,
                  // this concept is => if mouse hover is false then show logo otherwise show the text
                  child: isHover
                      ? const Text(
                          "Nike",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 120,
                            color: Colors.grey,
                          ),
                        )
                      : Image.asset(
                          "image/nikelogo.png",
                          height: 240,
                          color: Colors.grey,
                          fit: BoxFit.cover,
                        ),
                ),
                // Animated cirlular Background
                AnimatedPositioned(
                  curve: Curves.easeIn,
                  top: isHover ? -240 : -80,
                  right: isHover ? -100 : -80,
                  duration: const Duration(milliseconds: 600),
                  child: AnimatedContainer(
                    height: isHover ? 450 : 280,
                    width: isHover ? 450 : 280,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    duration: const Duration(milliseconds: 600),
                  ),
                ),
                // Animated shoe image
                AnimatedAlign(
                  alignment: isHover
                      ? const Alignment(0, -0.9)
                      : const Alignment(0, -0.3),
                  duration: const Duration(milliseconds: 400),
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.asset(
                      "image/shoe.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Animated details section
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeOut,
                  bottom: isHover ? 0 : -120,
                  child: SizedBox(
                    height: 200,
                    width: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "AirMax",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 5),
                        // Animated Size buttons
                        AnimatedOpacity(
                          opacity: isHover ? 1 : 0,
                          duration: isHover
                              ? const Duration(milliseconds: 600)
                              : const Duration(milliseconds: 400),
                          curve: isHover ? Curves.easeInOut : Curves.easeOut,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Size:",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              SizeButton(value: "10"),
                              SizeButton(value: "11"),
                              SizeButton(value: "12"),
                              SizeButton(value: "13"),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        // Animated color option
                        AnimatedOpacity(
                          opacity: isHover ? 1 : 0,
                          duration: isHover
                              ? const Duration(milliseconds: 1000)
                              : const Duration(milliseconds: 400),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Size:",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 10),
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.white,
                              ),
                              SizedBox(width: 10),
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.green,
                              ),
                              SizedBox(width: 10),
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.red,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Animated buy button
                        const BuyButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SizeButton extends StatefulWidget {
  final String value;
  const SizeButton({super.key, required this.value});

  @override
  State<SizeButton> createState() => _SizeButtonState();
}

class _SizeButtonState extends State<SizeButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            isHover = true; // set isHovered to true when mouse enters
          });
        },
        onExit: (event) {
          setState(() {
            isHover = false; // set isHovered to false when mouse exit
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: isHover ? Colors.green : Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              widget.value,
              style: TextStyle(
                color: isHover ? Colors.white : Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BuyButton extends StatefulWidget {
  const BuyButton({super.key});

  @override
  State<BuyButton> createState() => _BuyButtonState();
}

class _BuyButtonState extends State<BuyButton> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHover = true; // set isHovered to true when mouse enters
        });
      },
      onExit: (event) {
        setState(() {
          isHover = false; // set isHovered to false when mouse exit
        });
      },
      child: AnimatedPositioned(
        bottom: isHover ? 20 : -100,
        duration: isHover
            ? const Duration(milliseconds: 800)
            : const Duration(milliseconds: 500),
        child: AnimatedOpacity(
          opacity: 1,
          duration: Duration(milliseconds: 1100),
          child: SizedBox(
            width: 100,
            child: Center(
              child: TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.black87,
                    backgroundColor: isHover ? Colors.green : Colors.white,
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                onPressed: () {},
                child: Text(
                  "Buy Now",
                  style: TextStyle(
                    color: isHover ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
