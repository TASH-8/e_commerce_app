import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/core/theming/text_styles.dart';

/// Function that builds and returns the AppBar
AppBar buildAppBar(double screenWidth) {
  return AppBar(
    backgroundColor: Colors.transparent,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Back Button
        Icon(
          Icons.arrow_back,
          color: ColorManger.redAccent,
          size: screenWidth * 0.075,
        ),
    
        // Title
        Flexible(
          child: AutoSizeText(
            Constants.FAUX_SUED_ANKLE_BOOTS,
            style: TextStyles.font18CustomGreyLight,
            maxLines: 1,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),
    
        // Cart Icon
        Icon(
          Icons.shopping_cart_outlined,
          size: screenWidth * 0.075,
          color: ColorManger.grey,
        ),
      ],
    ),
  );
}
