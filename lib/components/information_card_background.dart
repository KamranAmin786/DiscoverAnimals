import 'package:demo_example/utilities/colors.dart';
import 'package:flutter/material.dart';

class InformationCardBackground extends StatelessWidget {
  const InformationCardBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        gradient: const LinearGradient(
          colors: [
            customBlueLight,
            customMediumBlue,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          const BoxShadow(
            color: customDarkBlue,
            offset: Offset(0, 12),
            blurRadius: 0,
          ),
          BoxShadow(
            color: customBlueLight.withOpacity(0.85),
            offset: const Offset(0, 3),
            blurRadius: 0,
          ),
        ],
      ),
    );
  }
}