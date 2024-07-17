import 'package:flutter/material.dart';
import 'dart:math' as math;

// Main StatefulWidget that manages the entire animation and UI.
class CustomAnimation extends StatefulWidget {
  const CustomAnimation({super.key});

  @override
  State<CustomAnimation> createState() => _CustomAnimationState();
}

class _CustomAnimationState extends State<CustomAnimation>
    with TickerProviderStateMixin {
  // Animation controller for manangin animation
  late AnimationController _animationController;
  //Animation for scaling the container
  late Animation<double> _scaleAnimation;
  //Animation for aligining the container
  late Animation<double> _alignAnimation;
  //Animation for changeing the border radius
  late Animation<double> _borderRadiusAnimation;
  //Animation for scaling the close icon
  late Animation<double> _iconScaleAnimation;
  //Animation for rotating the close icon
  late Animation<double> _iconRotateAnimation;
  // for check, if the menu is open or closed.
  bool isOpen = false;
  @override
  void initState() {
    super.initState();
    // Initializing the animationcontroller with a duration
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 375),
    );
    //
    // Curve animation to apply easing effect
    final curveAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.ease);

    // Define  various animations using Tween and Curved animation
    _scaleAnimation = Tween(begin: 59.0, end: 200.0).animate(curveAnimation);
    _alignAnimation = Tween(begin: 0.0, end: -1.0).animate(curveAnimation);
    _borderRadiusAnimation =
        Tween(begin: 100.0, end: 15.0).animate(curveAnimation);
    _iconScaleAnimation = Tween(begin: 0.0, end: 30.0).animate(curveAnimation);
    _iconRotateAnimation =
        Tween(begin: 0.0, end: math.pi).animate(curveAnimation);
  }

  // function to toggle the menu's open/colse state.
  void toggleMenu() {
    setState(() {
      if (isOpen) {
        _animationController.reverse(); // reverse animation when closing
      } else {
        _animationController.forward(); // forward animation when opening
      }
      isOpen = !isOpen; // toggle the state.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Center(
        child: SizedBox(
          // color: Colors.white,
          height: 235,
          width: 200,
          child: Stack(
            children: [
              _buildAnimatedContainer(), // build the animated container.
              _buildMenuIcon() // Build the menu icon and cross icon
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedContainer() {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Align(
          alignment: Alignment(_alignAnimation.value, _alignAnimation.value),
          child: Container(
            height: _scaleAnimation.value,
            width: _scaleAnimation.value,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                _borderRadiusAnimation.value,
              ),
            ),
            child: child,
          ),
        );
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            SocialShareIcon(
              index: 1,
              title: "TikTok",
              icon: Icons.tiktok,
              color: Colors.black,
              isOpen: isOpen,
            ),
            SocialShareIcon(
              index: 2,
              title: "Telegram",
              icon: Icons.telegram,
              color: Colors.lightBlue,
              isOpen: isOpen,
            ),
            SocialShareIcon(
              index: 3,
              title: "Discord",
              icon: Icons.discord,
              color: Colors.purple,
              isOpen: isOpen,
            ),
            SocialShareIcon(
              index: 4,
              title: "Facebook",
              icon: Icons.facebook,
              color: Colors.lightBlue,
              isOpen: isOpen,
            ),
          ],
        ),
      ),
    );
  }

  // Function for build the menu icon
  Widget _buildMenuIcon() {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Align(
            alignment: Alignment(
                _animationController.value, _animationController.value),
            child: InkWell(
              onTap: toggleMenu,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Transform.rotate(
                    angle: _iconRotateAnimation.value,
                    child: Icon(
                      Icons.close_rounded,
                      color: Colors.black,
                      size: _iconScaleAnimation.value,
                    ),
                  ),
                  if (_animationController.isDismissed)
                    const Icon(
                      Icons.menu,
                      size: 40,
                      color: Colors.black,
                    ),
                ],
              ),
            ),
          );
        });
  }
}

//
class SocialShareIcon extends StatefulWidget {
  final int index;
  final String title;
  final Color color;
  final IconData icon;
  final bool isOpen;
  const SocialShareIcon({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.isOpen,
    required this.index,
  });

  @override
  State<SocialShareIcon> createState() => _SocialShareIconState();
}

class _SocialShareIconState extends State<SocialShareIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController
      _controller; // animation controller for individual items
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 375),
    );
    if (widget.isOpen) {
      Future.delayed(Duration(milliseconds: widget.index * 200), () {
        if (mounted) _controller.forward();
      });
    }
  }

  @override
  void didUpdateWidget(SocialShareIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (mounted) {
      if (widget.isOpen) {
        Future.delayed(Duration(milliseconds: widget.index * 200), () {
          if (mounted) _controller.forward();
        });
      } else {
        _controller.reverse();
      }
    } 
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _controller.value,
          child: Opacity(
            opacity: _controller.value,
            child: Material(
              color: Colors.white,
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 45,
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Icon(
                          widget.icon,
                          size: 40,
                          color: widget.color,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          widget.title,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
