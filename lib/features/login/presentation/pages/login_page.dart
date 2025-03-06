import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/core/widgets/signup_login_btn_forgot.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/theming/text_styles.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/core/widgets/login_forgot_row.dart';
import 'package:e_commerce_app/features/forget_reset/presentation/widgets/terms_and_policy_btn.dart';
import 'package:e_commerce_app/core/widgets/text_fields.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch screen dimensions for responsiveness
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManger.greyshade100,
        leading: IconButton(
            onPressed: () {
              context.pushReplacement('/');
            },
            icon: const Icon(Icons.undo)),
      ),
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
                  Constants.LOGIN,
                  style: TextStyles.font31BlackBold,
                  maxLines: 1,
                ),
                SizedBox(height: screenHeight * 0.02),

                // Navigation Row
                CustomLoginAndForgotRow(
                  screenWidth: screenWidth,
                  isLoginScreen: true,
                  forgetOnpressed: () async {
                    if (email.text == "") {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Enter an email',
                        desc: 'Enter an email to reset password',
                      ).show();
                      return;
                    }
                    try {
                      FirebaseAuth.instance
                          .sendPasswordResetEmail(email: email.text);
                    } catch (e) {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.info,
                        animType: AnimType.rightSlide,
                        title: 'Reset Password',
                        desc:
                            'A password reset link has been sent to your email',
                      ).show();
                    }
                  },
                ),

                SizedBox(height: screenHeight * 0.04),

                // Email TextField
                Textfields(
                  icon: Icons.email,
                  hintText: Constants.EMAILTEXTHINT,
                  screenHeight: screenHeight,
                  controller: email,
                ),
                SizedBox(height: screenHeight * 0.02),

                // Password TextField
                Textfields(
                  icon: Icons.lock,
                  hintText: Constants.PASSWORD,
                  screenHeight: screenHeight,
                  controller: password,
                ),
                SizedBox(height: screenHeight * 0.03),

                // Log In Button
                SignUpLogInForgotBtn(
                  isLoginsbutton: true,
                  isResetButton: false,
                  onpressed: () async {
                    try {
                      print(
                          "askdh11111111111111111111ufikausdhfiulahsdiulfhaisudlhf");
                      // ignore: unused_local_variable
                      final credential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                        email: email.text,
                        password: password.text,
                      );
                      print(
                          "askdhu222222222222222fikausdhfiulahsdiulfhaisudlhf");
                      context.pushReplacement('/home');

                      print("askdhufikausd333333333333hfiulahsdiulfhaisudlhf");
                    } on FirebaseAuthException catch (e) {
                      print(e.message);
                      // if (e == 'user-not-found') {
                      //   print('No user found for that email.');
                      // } else if (e == 'wrong-password') {
                      //   print('Wrong password provided for that user.');

                      if (e.message ==
                          "The email address is badly formatted.") {
                        print("The email address is badly formatted098765432.");
                      }
                    }
                  },
                ),
                SizedBox(height: screenHeight * 0.02),

                // Terms of Service
                const AutoSizeText(
                  Constants.ByLoggingIn,
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
