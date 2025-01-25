import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:flutter/material.dart';

// List of colors
List<Color> colorList = [
  ColorManger.pinkCustom,
  ColorManger.orangeCustom,
  ColorManger.blueCustom,
  ColorManger.white,
  ColorManger.greyCustom,
  ColorManger.blackCustom,
];

class ColorsContainers extends StatelessWidget {
  const ColorsContainers({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Wrap(
      children: List.generate(
        colorList.length,
        (index) => Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.02, vertical: screenHeight * 0.01),
          child: Container(
            width: screenWidth * 0.12,
            height: screenWidth * 0.12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorList[index],
            ),
          ),
        ),
      ),
    );
  }
}
