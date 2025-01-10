import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/core/theming/text_styles.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:flutter/material.dart';

class ShareAddtocartBTN extends StatelessWidget {
  const ShareAddtocartBTN({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          // SHARETHIS Button
          Center(
            child: Container(
              height: screenHeight * 0.06, // Adjusted to screen height
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05), // Adjusted to screen width
              decoration: BoxDecoration(
                color: ColorManger.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: ColorManger.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(Constants.SHARETHIS,
                      style: TextStyles.font16greyCustomShadeBoldSpacingHalf),
                  SizedBox(
                      width: screenWidth * 0.03), // Adjusted to screen width
                  Container(
                    height: screenHeight * 0.04, // Adjusted to screen height
                    width: screenWidth * 0.08, // Adjusted to screen width
                    decoration: BoxDecoration(
                      color: ColorManger.greyCustomShade,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_upward,
                      color: ColorManger.white,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: screenWidth * 0.03), // Adjusted to screen width
          // ADD TO CART Button
          Center(
            child: Container(
              height: screenHeight * 0.06, // Adjusted to screen height
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05), // Adjusted to screen width
              decoration: BoxDecoration(
                color: ColorManger.redAccentCustom,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: ColorManger.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const AutoSizeText(Constants.ADDTOCART,
                      style: TextStyles.font16WhiteBoldSpacingHalf),
                  SizedBox(
                      width: screenWidth * 0.03), // Adjusted to screen width
                  Container(
                    height: screenHeight * 0.04, // Adjusted to screen height
                    width: screenWidth * 0.08, // Adjusted to screen width
                    decoration: const BoxDecoration(
                      color: ColorManger.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: ColorManger.redAccentCustom,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
