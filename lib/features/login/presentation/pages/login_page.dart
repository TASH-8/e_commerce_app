import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/core/widgets/signup_login_btn_forgot.dart';
import 'package:e_commerce_app/features/signup/presentation/widgets/email_textfield.dart';
import 'package:e_commerce_app/features/signup/presentation/widgets/password_textfield.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/theming/text_styles.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/core/widgets/login_forgot_row.dart';
import 'package:e_commerce_app/features/forget_password/presentation/widgets/terms_and_policy_btn.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Fetch screen dimensions for responsiveness
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

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
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: screenHeight,
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Form(
                key: formKey,
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
                        forgetOnpressed: () {
                          context.push('/forget');
                        }),

                    SizedBox(height: screenHeight * 0.04),

                    // Email TextField
                    EmailTextField(email: email),
                    SizedBox(height: screenHeight * 0.02),

                    // Password TextField
                    PasswordTextField(password: password),
                    SizedBox(height: screenHeight * 0.03),

                    // Log In Button
                    BlocConsumer<LoginBloc, LoginState>(
                      listener: (context, state) {
                        if (state.status == LoginStateStatus.error) {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.warning,
                            animType: AnimType.bottomSlide,
                            title: Constants.ERROR,
                            desc: state.message,
                          ).show();
                        } else if (state.status == LoginStateStatus.success) {
                          context.pushReplacement('/home');
                        }
                      },
                      builder: (context, state) {
                        return SignUpLogInForgotBtn(
                          isLoginsbutton: true,
                          isResetButton: false,
                          isLoading: state.status == LoginStateStatus.loading,
                          onpressed: () {
                            context.read<LoginBloc>().add(
                                  GetUserLoginDataEvent(
                                    email: email.text,
                                    password: password.text,
                                  ),
                                );
                          },
                        );
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
        ),
      ),
    );
  }
}
