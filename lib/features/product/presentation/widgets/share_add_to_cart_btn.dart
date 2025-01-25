import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/core/theming/text_styles.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/features/product/presentation/widgets/custom_share_add_to_cart_btn.dart';
import 'package:flutter/material.dart';

class ShareAddtocartBTN extends StatelessWidget {
  const ShareAddtocartBTN({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.02,
        vertical: screenHeight * 0.01,
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // SHARETHIS Button
            CustomShareAddToCartBTN(
              text: Constants.SHARETHIS,
              textStyle: TextStyles.font16greyCustomShadeBoldSpacingHalf,
              backgroundColor: ColorManger.white.withOpacity(0.8),
              icon: Icons.arrow_upward,
              iconColor: ColorManger.white,
              iconBackgroundColor: ColorManger.greyCustomShade,
              screenWidth: screenWidth,
              screenHeight: screenHeight,
            ),
            SizedBox(width: screenWidth * 0.02),
            // ADD TO CART Button
            CustomShareAddToCartBTN(
              text: Constants.ADDTOCART,
              textStyle: TextStyles.font16WhiteBoldSpacingHalf,
              backgroundColor: ColorManger.redAccentCustom.withOpacity(0.9),
              icon: Icons.arrow_forward,
              iconColor: ColorManger.redAccentCustom,
              iconBackgroundColor: ColorManger.white,
              screenWidth: screenWidth,
              screenHeight: screenHeight,
            ),
          ],
        ),
      ),
    );
  }
}
