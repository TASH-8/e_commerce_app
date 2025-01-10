import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:flutter/material.dart';

// List of size strings
List<String> sizeList = [
  Constants.size4_5,
  Constants.size5_0,
  Constants.size6_5,
  Constants.size7_0,
  Constants.size8_0,
];

class SizeContainers extends StatelessWidget {
  const SizeContainers({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        sizeList.length,
        (index) => Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ColorManger.white,
              ),
              height: screenHeight * 0.05,
              width: screenWidth * 0.2,
              child: Center(
                child: Text(sizeList[index]),
              ),
            ),
            if (index != sizeList.length - 1)
              SizedBox(
                width: screenWidth * 0.04,
              ),
          ],
        ),
      ),
    );
  }
}
