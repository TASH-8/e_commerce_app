import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/core/theming/text_styles.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/core/widgets/login_forgot_row.dart';
import 'package:e_commerce_app/core/widgets/signup_login_btn_forgot.dart';
import 'package:e_commerce_app/features/forget_reset/presentation/widgets/terms_and_policy_btn.dart';
import 'package:e_commerce_app/core/widgets/textFields.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch screen dimensions for responsiveness
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ColorManger.greyshade100,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Title
                const AutoSizeText(
                  Constants.SIGNUP,
                  style: TextStyles.font31BlackBold,
                  maxLines: 1,
                ),
                SizedBox(height: screenHeight * 0.02),

                // Navigation Row
                CustomLoginAndForgotRow(
                  screenWidth: screenWidth,
                  isLoginScreen: false,
                ),

                SizedBox(height: screenHeight * 0.04),

                // Email TextField
                Textfields(
                  icon: Icons.email,
                  hintText: Constants.EMAILTEXTHINT,
                  screenHeight: screenHeight,
                ),
                SizedBox(height: screenHeight * 0.02),

                // Username TextField
                Textfields(
                  icon: Icons.person,
                  hintText: Constants.USERNAME,
                  screenHeight: screenHeight,
                ),
                SizedBox(height: screenHeight * 0.02),

                // Password TextField
                Textfields(
                  icon: Icons.lock,
                  hintText: Constants.PASSWORD,
                  screenHeight: screenHeight,
                ),
                SizedBox(height: screenHeight * 0.03),

              //  Sign Up Button
                SignUpLogInForgotBtn(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  isLoginsbutton: false,
                  isResetButton: false,
                ),
                // const SignUpButton(),
                SizedBox(height: screenHeight * 0.02),

                // Terms of Service
                const AutoSizeText(
                  Constants.ByCreatingAnAcoount,
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
