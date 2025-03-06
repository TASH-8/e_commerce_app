import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/core/theming/text_styles.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:flutter/material.dart';

class SignUpLogInForgotBtn extends StatelessWidget {
  const SignUpLogInForgotBtn({
    super.key,
    required this.isLoginsbutton,
    required this.isResetButton,
    required this.onpressed,
    this.isLoading = false,
  });

  final bool isLoginsbutton;
  final bool isResetButton;
  final VoidCallback onpressed;
  final bool isLoading; // ✅ Add loading state
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    if (isLoginsbutton == true) {
      return ElevatedButton(
        onPressed: isLoading ? null : onpressed, // ✅ Disable when loading
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.02,
            horizontal: screenWidth * 0.3,
          ),
          backgroundColor:
              ColorManger.redAccentCustom, // ✅ Keep exact red color
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(30), // ✅ Keep exact border radius
          ),
          elevation: 4, // ✅ Maintain slight elevation for shadow effect
        ),
        child: isLoading
            ? SizedBox(
                width: screenWidth * 0.06,
                height: screenHeight * 0.03,
                child: const CircularProgressIndicator(
                  strokeWidth: 3, // ✅ Match thickness
                  color: Colors.white,
                ),
              ) // ✅ Loading replaces text
            : Text(
                Constants.LOGIN, // ✅ Exact text
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenHeight * 0.025, // ✅ Match text size
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2, // ✅ Keep spacing
                ),
              ),
      );
    } else if (isResetButton == true) {
      return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManger.redAccentCustom,
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
        onPressed: isLoading ? null : onpressed, // ✅ Disable when loading
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.02,
            horizontal: screenWidth * 0.3,
          ),
          backgroundColor:
              ColorManger.redAccentCustom, // ✅ Keep exact red color
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(30), // ✅ Keep exact border radius
          ),
          elevation: 4, // ✅ Maintain slight elevation for shadow effect
        ),
        child: isLoading
            ? SizedBox(
                width: screenWidth * 0.06,
                height: screenHeight * 0.03,
                child: const CircularProgressIndicator(
                  strokeWidth: 3, // ✅ Match thickness
                  color: Colors.white,
                ),
              ) // ✅ Loading replaces text
            : Text(
                "Sign Up", // ✅ Exact text
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenHeight * 0.025, // ✅ Match text size
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2, // ✅ Keep spacing
                ),
              ),
      );
    }
  }
}
