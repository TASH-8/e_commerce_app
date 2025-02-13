import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/core/theming/text_styles.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/features/product/presentation/widgets/custom_icon_for_share_add_btns.dart';
import 'package:flutter/material.dart';

class ShareBtn extends StatelessWidget {
  const ShareBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Flexible(
      child: InkWell(
        borderRadius: BorderRadius.circular(25),
        onTap: () {},
        child: Container(
          height: screenHeight * 0.05,
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.03,
          ),
          decoration: BoxDecoration(
            color: ColorManger.white.withOpacity(0.8),
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
                  Constants.SHARETHIS,
                  style: TextStyles.font16greyCustomShadeBoldSpacingHalf,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: screenWidth * 0.02),
              // Reusable Icon Widget
              CustomIcon(
                icon: Icons.arrow_upward,
                iconColor: ColorManger.white,
                iconBackgroundColor: ColorManger.greyCustomShade,
                screenWidth: screenWidth,
                screenHeight: screenHeight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
