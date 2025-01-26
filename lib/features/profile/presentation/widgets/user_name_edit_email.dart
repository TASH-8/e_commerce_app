import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/core/theming/text_styles.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:flutter/material.dart';

class UserNameEditEmail extends StatelessWidget {
  const UserNameEditEmail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            Constants.USERNAME,
            style: TextStyles.font35CustomGreyBold,
            maxLines: 1, // Ensure no overflow
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: screenHeight * 0.01, // 1% of screen height
          ),
          AutoSizeText(
            Constants.EMAILTEXTHINT,
            style: TextStyles.font14CustomGreyRegular,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: screenHeight * 0.02, // 2% of screen height
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05, // 5% of screen width
              vertical: screenHeight * 0.01, // 1% of screen height
            ),
            decoration: BoxDecoration(
              border: Border.all(color: ColorManger.greyCustom),
              borderRadius: BorderRadius.circular(18),
              color: ColorManger.greyshade100,
            ),
            child: AutoSizeText(
              Constants.EDITPROFILE,
              style: TextStyles.font14CustomGreyBold,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
