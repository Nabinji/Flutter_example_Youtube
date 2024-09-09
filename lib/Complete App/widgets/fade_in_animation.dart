import 'package:flutter/material.dart';

class AnimationPosition {
  final double? topBefore,
      topAfter,
      leftBefore,
      leftAfter,
      rightBefore,
      rightAfter,
      bottomBefore,
      bottomAfter;

  AnimationPosition({
    this.topBefore,
    this.topAfter,
    this.leftBefore,
    this.leftAfter,
    this.rightBefore,
    this.rightAfter,
    this.bottomBefore,
    this.bottomAfter,
  });
}

class FadeInAnimation extends StatefulWidget {
  final Widget child;
  final int durationInMs;
  final AnimationPosition animationPosition;
  const FadeInAnimation({
    super.key,
    required this.child,
    required this.durationInMs,
    required this.animationPosition,
  });

  @override
  State<FadeInAnimation> createState() => _FadeInAnimationState();
}

class _FadeInAnimationState extends State<FadeInAnimation> {
  bool? animated;
  @override
  void initState() {
    super.initState();
    changeAnimation();
  }

  Future changeAnimation() async {
    animated = false;
    await Future.delayed(const Duration(milliseconds: 1000));
    if (mounted) {
      setState(() {
        animated = true;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: widget.durationInMs),
      top: animated!
          ? widget.animationPosition.topAfter
          : widget.animationPosition.topBefore,
      left: animated!
          ? widget.animationPosition.leftAfter
          : widget.animationPosition.leftBefore,
      right: animated!
          ? widget.animationPosition.rightAfter
          : widget.animationPosition.rightBefore,
      bottom: animated!
          ? widget.animationPosition.bottomAfter
          : widget.animationPosition.bottomBefore,
      child: widget.child,
    );
  }
}
