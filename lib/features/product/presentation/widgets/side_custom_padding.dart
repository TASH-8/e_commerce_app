import 'package:flutter/material.dart';

class SidesCustomPadding extends StatelessWidget {
  const SidesCustomPadding({super.key, required this.child});
final dynamic child ;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),child: child,);
  }
}
