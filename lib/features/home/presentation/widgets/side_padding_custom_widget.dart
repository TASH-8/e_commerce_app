import 'package:flutter/material.dart';

class SidesCustomPaddingWidget extends StatelessWidget {
  const SidesCustomPaddingWidget({super.key, required this.child});

  final child;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
      ),
      child: child,
    );
  }
}
