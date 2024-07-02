import 'package:flutter/material.dart';

class AwesomeHoverEffect extends StatefulWidget {
  const AwesomeHoverEffect({super.key});

  @override
  _AwesomeHoverEffectState createState() => _AwesomeHoverEffectState();
}

class _AwesomeHoverEffectState extends State<AwesomeHoverEffect> {
  @override
  void initState() {
    super.initState();
  }

  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MouseRegion(
          onEnter: (value) {
            setState(() {
              isHovered = true; // set isHovered to true when mouse enters
            });
          },
          onExit: (value) {
            setState(() {
              isHovered = false; // set isHovered to false when mouse exit
            });
          },
          child: Container(
            height: 400.0,
            width: 300.0,
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Stack(
              children: [
                // Display text or logo based on hover state
                Positioned(
                  left: 20.0,
                  top: 190.0,
                  child: isHovered
                      ? const Text(
                          'Nike',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 120.0,
                            color: Colors.grey,
                          ),
                        )
                      : Image.asset(
                          "image/nikelogo.png",
                          height: 240,
                          color: Colors.grey,
                        ),
                ),
                // Animated circle background
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeOut,
                  top: isHovered ? -240.0 : -80.0,
                  right: isHovered ? -100.0 : -80.0,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeOut,
                    height: isHovered ? 450.0 : 280.0,
                    width: isHovered ? 450.0 : 280.0,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                // Animated shoe image
                AnimatedAlign(
                  duration: const Duration(milliseconds: 375),
                  curve: Curves.easeOut,
                  alignment: isHovered
                      ? const Alignment(0.0, -0.9)
                      : const Alignment(0.0, -0.3),
                  child: SizedBox(
                    height: 200,
                    width: 200.0,
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
                  bottom: isHovered ? 0.0 : -130.0,
                  child: SizedBox(
                    height: 200.0,
                    width: 300.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Air Max',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        // Animated size buttons
                        AnimatedOpacity(
                          opacity: isHovered ? 1.0 : 0.0,
                          duration: isHovered
                              ? const Duration(milliseconds: 600)
                              : const Duration(milliseconds: 400),
                          curve:
                              isHovered ? Curves.easeInOutBack : Curves.easeOut,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Size: ',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                ),
                              ),
                              SizeButton(value: '10'),
                              SizeButton(value: '11'),
                              SizeButton(value: '12'),
                              SizeButton(value: '13'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        // Animated color options
                        AnimatedOpacity(
                          opacity: isHovered ? 1.0 : 0.0,
                          duration: isHovered
                              ? const Duration(milliseconds: 1000)
                              : const Duration(milliseconds: 400),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Color: ',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 10.0),
                              CircleAvatar(
                                radius: 9.0,
                                backgroundColor: Colors.white,
                              ),
                              SizedBox(width: 10.0),
                              CircleAvatar(
                                radius: 9.0,
                                backgroundColor: Colors.red,
                              ),
                              SizedBox(width: 10.0),
                              CircleAvatar(
                                radius: 9.0,
                                backgroundColor: Colors.green,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20.0),
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
  final String? value;
  const SizeButton({super.key, this.value});

  @override
  _SizeButtonState createState() => _SizeButtonState();
}

class _SizeButtonState extends State<SizeButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: MouseRegion(
        onEnter: (value) {
          setState(() {
            isHovered = true;
          });
        },
        onExit: (value) {
          setState(() {
            isHovered = false;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          height: 30.0,
          width: 30.0,
          decoration: BoxDecoration(
            color: isHovered ? Colors.green : Colors.white,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Center(
            child: Text(
              widget.value!,
              style: TextStyle(
                color: isHovered ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w600,
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
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (value) {
        setState(() {
          isHovered = false;
        });
      },
      child: AnimatedPositioned(
        duration: isHovered
            ? const Duration(milliseconds: 800)
            : const Duration(milliseconds: 500),
        bottom: isHovered ? 20.0 : -100.0,
        child: AnimatedOpacity(
          opacity: 1.0,
          duration: const Duration(milliseconds: 1075),
          curve: Curves.easeOut,
          child: SizedBox(
            width: 320.0,
            child: Center(
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black87,
                  backgroundColor: isHovered ? Colors.green : Colors.white,
                  padding: const EdgeInsets.all(20.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Buy Now',
                  style: TextStyle(
                    color: isHovered ? Colors.white : Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
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
