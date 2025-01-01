import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/core/theming/text_styles.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:flutter/material.dart';

class SeeMoreBTN extends StatelessWidget {
  const SeeMoreBTN({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth * 0.34,
      height: screenHeight * 0.05,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            AutoSizeText(
              Constants.SEE_MORE,
              maxLines: 1,
              style: TextStyles.font14GreyCustomShadeRegular,
            ),
            const Spacer(),
            Container(
              width: screenHeight * 0.04,
              height: screenHeight * 0.04,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: ColorManger.redAccent,
              ),
              child: const Icon(
                Icons.arrow_forward,
                color: ColorManger.white,
                size: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
