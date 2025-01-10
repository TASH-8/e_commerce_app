import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/theming/text_styles.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:flutter/material.dart';

class FirstHalfDetails extends StatelessWidget {
  const FirstHalfDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AutoSizeText(
            Constants.BRAND,
            style: TextStyles.font15GreyBold,
            maxLines: 1,
          ),
          AutoSizeText(
            Constants.LilysAnkleBoots,
            style: TextStyles.font14CustomGreyRegular,
            maxLines: 1,
          ),
          SizedBox(height: screenHeight * 0.03),
          const AutoSizeText(
            Constants.CONDITION,
            style: TextStyles.font15GreyBold,
            maxLines: 1,
          ),
          AutoSizeText(
            Constants.BRAND_NEW,
            style: TextStyles.font14CustomGreyRegular,
            maxLines: 1,
          ),
          SizedBox(height: screenHeight * 0.03),
          const AutoSizeText(
            Constants.CATEGORY,
            style: TextStyles.font15GreyBold,
            maxLines: 1,
          ),
          AutoSizeText(
            Constants.WOMEN_SHOES,
            style: TextStyles.font14CustomGreyRegular,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}

class SecondHalfDetails extends StatelessWidget {
  const SecondHalfDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const AutoSizeText(
            Constants.SKU,
            style: TextStyles.font15GreyBold,
            maxLines: 1,
          ),
          AutoSizeText(
            Constants.SKU_NUMBER,
            style: TextStyles.font14CustomGreyRegular,
            maxLines: 1,
          ),
          SizedBox(height: screenHeight * 0.03),
          const AutoSizeText(
            Constants.MATERIAL,
            style: TextStyles.font15GreyBold,
            maxLines: 1,
          ),
          AutoSizeText(
            Constants.FAUX_SUED_VELVET,
            style: TextStyles.font14CustomGreyRegular,
            maxLines: 1,
          ),
          SizedBox(height: screenHeight * 0.03),
          const AutoSizeText(
            Constants.FITTING,
            style: TextStyles.font15GreyBold,
            maxLines: 1,
          ),
          AutoSizeText(
            Constants.TRUE_TO_SIZE,
            style: TextStyles.font14CustomGreyRegular,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
