import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/theming/text_styles.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:flutter/material.dart';

class TextBtnLogInSignUp extends StatelessWidget {
  const TextBtnLogInSignUp(
      {super.key,
      required this.isLoginScreen,
      this.onpressed,
      this.email,
      this.forgetOnpressed});
  final bool isLoginScreen;
  final onpressed;
  final email;
  final forgetOnpressed;
  @override
  Widget build(BuildContext context) {
    if (isLoginScreen == true) {
      return TextButton(
        onPressed: forgetOnpressed,
        child: const AutoSizeText(
          Constants.ForgotPas,
          style: TextStyles.font17redAccentBold,
          maxLines: 1,
        ),
      );
    } else {
      return TextButton(
        onPressed: () {
          onpressed;
        },
        child: TextButton(
            onPressed: onpressed,
            child: const AutoSizeText(
              Constants.LOGIN,
              style: TextStyles.font17redAccentBold,
              maxLines: 1,
            )),
      );
    }
  }
}
