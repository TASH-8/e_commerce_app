import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/app_images/app_images.dart';
import 'package:e_commerce_app/core/theming/text_styles.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/see_more_btn.dart';
import 'package:flutter/material.dart';

class CustomLatestSectionItems extends StatelessWidget {
  const CustomLatestSectionItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

   return ClipRRect(
  borderRadius: BorderRadius.circular(11),
  child: Container(
    width: screenWidth * 0.9,
    height: screenHeight * 0.28,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(11),
      image: const DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(
          Assets.assetsGiganiga,
        ),
      ),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.035,
        horizontal: screenWidth * 0.05,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            Constants.LATESTSECTION_TEXT_INFO,
            style: TextStyles.font18WhiteRegular,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          const SeeMoreBTN(),
        ],
      ),
    ),
  ),
);
  }
}
