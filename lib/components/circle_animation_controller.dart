import 'dart:math';
import 'package:flutter/material.dart';

class CircleAnimationController extends StatefulWidget {
  @override
  _CircleAnimationControllerState createState() => _CircleAnimationControllerState();
}

class _CircleAnimationControllerState extends State<CircleAnimationController>
    with TickerProviderStateMixin {
  int randomCircle = Random().nextInt(7) + 6;
  bool isAnimating = false;

  double randomCoordinate(double containerSize) {
    return Random().nextDouble() * containerSize;
  }

  double randomSize() {
    return Random().nextInt(77) + 4.0;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: 300,
          height: 300,
          child: Stack(
            children: List.generate(randomCircle, (index) {
              return AnimatedPositioned(
                duration: const Duration(milliseconds: 2000),
                curve: Curves.easeInOut,
                left: isAnimating ? randomCoordinate(256 - randomSize()) : 256 / 2,
                top: isAnimating ? randomCoordinate(256 - randomSize()) : 256 / 2,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 2000),
                  opacity: isAnimating ? 0.25 : 0.0,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 2000),
                    width: isAnimating ? randomSize() : 0,
                    height: isAnimating ? randomSize() : 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startAnimating();
  }

  void startAnimating() {
    isAnimating = true;
    Future.delayed(const Duration(milliseconds: 2000), () {
      setState(() {
        isAnimating = false;
        startAnimating();
      });
    });
  }
}
