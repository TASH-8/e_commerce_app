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

class ColorContainers extends StatelessWidget {
  const ColorContainers({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        colorList.length,
        (index) => Row(
          children: [
            Container(
              width: screenWidth * 0.12,
              height: screenWidth * 0.12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorList[index],
              ),
            ),
            if (index != colorList.length - 1)
              SizedBox(
                width: screenWidth * 0.04,
              ),
          ],
        ),
      ),
    );
  }
}
