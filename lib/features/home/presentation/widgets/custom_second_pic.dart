import 'package:e_commerce_app/core/app_images/app_images.dart';
import 'package:flutter/material.dart';

class CustomSecondPicture extends StatelessWidget {
  const CustomSecondPicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.03,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          Assets.assetsGiganiga,
          fit: BoxFit.cover,
          width: screenWidth * 0.9,
          height: screenHeight * 0.28,
        ),
      ),
    );
  }
}
