
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
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        Assets.assetsMdry,
        fit: BoxFit.cover,
        width: screenWidth * 0.9,
        height: screenHeight * 0.26,
      ),
    );
  }
}

