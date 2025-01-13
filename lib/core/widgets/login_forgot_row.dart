import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/theming/text_styles.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/features/login/presentation/widgets/text_btn_login.dart';
import 'package:flutter/material.dart';

class CustomLoginAndForgotRow extends StatelessWidget {
  const CustomLoginAndForgotRow({
    super.key,
    required this.screenWidth,
    required this.isLoginScreen,
  });
  final bool isLoginScreen;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    if (isLoginScreen == true) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TextBtnLogInSignUp(
            isLoginScreen: true,
          ),
          SizedBox(width: screenWidth * 0.05),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const TextBtnLogInSignUp(
          isLoginScreen: false,
        ),
        SizedBox(width: screenWidth * 0.05),
        const AutoSizeText(
          Constants.FORGOT,
          style: TextStyles.font17GreyNormal,
          maxLines: 1,
        ),
      ],
    );
  }
}
