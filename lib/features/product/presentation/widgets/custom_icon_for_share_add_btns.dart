import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBackgroundColor;
  final double screenWidth;
  final double screenHeight;

  const CustomIcon({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.iconBackgroundColor,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.04,
      width: screenWidth * 0.08,
      decoration: BoxDecoration(
        color: iconBackgroundColor,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: 18,
      ),
    );
  }
}
