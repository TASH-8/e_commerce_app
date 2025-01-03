import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/core/theming/text_styles.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:flutter/material.dart';

class SignUpLogInForgotBtn extends StatelessWidget {
  const SignUpLogInForgotBtn({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.isLoginsbutton,
    required this.isResetButton, 
  });
  final double screenHeight;
  final double screenWidth;
  final bool isLoginsbutton;
  final bool isResetButton;

  @override
  Widget build(BuildContext context) {
    if (isLoginsbutton == true) {
      return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManger.redAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.02,
            horizontal: screenWidth * 0.3,
          ),
        ),
        child: const AutoSizeText(
          Constants.LOGIN,
          style: TextStyles.font18WhiteBold,
          maxLines: 1,
        ),
      );
    } else if (isResetButton == true) {
      return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManger.redAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.02,
            horizontal: screenWidth * 0.3,
          ),
        ),
        child: const AutoSizeText(
          Constants.SEND_EMAIL,
          style: TextStyles.font18WhiteBold,
          maxLines: 1,
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManger.redAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.02,
            horizontal: screenWidth * 0.3,
          ),
        ),
        child: const AutoSizeText(
          Constants.SINGUPcap,
          style: TextStyles.font18WhiteBold,
          maxLines: 1,
        ),
      );
    }
  }
}
