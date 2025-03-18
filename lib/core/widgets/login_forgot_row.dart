// ignore_for_file: prefer_typing_uninitialized_variables

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
    this.onpressed,
    this.email,
    this.forgetOnpressed,
  });
  final bool isLoginScreen;
  final double screenWidth;
  final onpressed;
  final email;
  final forgetOnpressed;

  @override
  Widget build(BuildContext context) {
    if (isLoginScreen) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: TextBtnLogInSignUp(
              email: email,
              isLoginScreen: true,
              onpressed: onpressed,
              forgetOnpressed: forgetOnpressed,
            ),
          ),
          SizedBox(width: screenWidth * 0.05),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: TextBtnLogInSignUp(
            onpressed: onpressed,
            isLoginScreen: false,
          ),
        ),
        SizedBox(width: screenWidth * 0.05),
        const Flexible(
          child: AutoSizeText(
            Constants.FORGOT,
            style: TextStyles.font17GreyNormal,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}