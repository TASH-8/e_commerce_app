import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/features/product/presentation/widgets/custom_icon_for_share_add_btns.dart';
import 'package:flutter/material.dart';

class CustomShareAddToCartBTN extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final Color backgroundColor;
  final IconData icon;
  final Color iconColor;
  final Color iconBackgroundColor;
  final double screenWidth;
  final double screenHeight;

  const CustomShareAddToCartBTN({
    super.key,
    required this.text,
    required this.textStyle,
    required this.backgroundColor,
    required this.icon,
    required this.iconColor,
    required this.iconBackgroundColor,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        height: screenHeight * 0.05,
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.03,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: AutoSizeText(
                text,
                style: textStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(width: screenWidth * 0.02),
            // Reusable Icon Widget
            CustomIcon(
              icon: icon,
              iconColor: iconColor,
              iconBackgroundColor: iconBackgroundColor,
              screenWidth: screenWidth,
              screenHeight: screenHeight,
            ),
          ],
        ),
      ),
    );
  }
}

