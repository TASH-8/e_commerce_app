import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/core/widgets/signup_login_btn_forgot.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/theming/text_styles.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/features/forget_reset/presentation/widgets/terms_and_policy_btn.dart';
import 'package:e_commerce_app/core/widgets/text_fields.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch screen dimensions for responsiveness
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ColorManger.greyshade100 ,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Title
                const AutoSizeText(
                  Constants.FORGOT_PASSWORD,
                  style: TextStyles.font31BlackBold,
                  maxLines: 1,
                ),
                SizedBox(height: screenHeight * 0.08),

                // Info Text
                const AutoSizeText(
                  Constants.FORGOT_PASSWORD_INFO, // Explanation text for reset
                  style: TextStyles.font15GreyNormal,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
                SizedBox(height: screenHeight * 0.04),

                // Email TextField
                Textfields(
                  icon: Icons.email,
                  hintText: Constants.EMAILTEXTHINT,
                  screenHeight: screenHeight,
                ),
                SizedBox(height: screenHeight * 0.03),

                // Reset Password Button
                SignUpLogInForgotBtn(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  isLoginsbutton: false,
                  isResetButton: true,
                ),
                SizedBox(height: screenHeight * 0.02),

                // Terms of Service
                const AutoSizeText(
                  Constants.ByResettingPassword,
                  style: TextStyles.font15GreyNormal,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
                const TermsAndPolicyBTN(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
