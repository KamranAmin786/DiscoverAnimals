import 'package:demo_example/components/circle_animation_controller.dart';
import 'package:flutter/material.dart';

class CircleView extends StatefulWidget {
  const CircleView({super.key});

  @override
  _CircleViewState createState() => _CircleViewState();
}

class _CircleViewState extends State<CircleView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isAnimateGradient = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() {
        setState(() {
          _isAnimateGradient = _animationController.value < 0.5;
        });
      });

    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 300,
      child: Stack(
        children: [
          // Circle with Gradient Fill
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue[500]!,
                        Colors.purple[300]!,
                      ],
                      begin: _isAnimateGradient
                          ? Alignment.topLeft
                          : Alignment.bottomLeft,
                      end: _isAnimateGradient
                          ? Alignment.bottomRight
                          : Alignment.topRight,
                    ),
                  ),
                );
              },
            ),
          ),
          // Add any other child widgets you want to display within the circle here.
          CircleAnimationController(),
        ],
      ),
    );
  }
}
