import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/core/theming/text_styles.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/core/widgets/login_forgot_row.dart';
import 'package:e_commerce_app/core/widgets/signup_login_btn_forgot.dart';
import 'package:e_commerce_app/features/forget_password/presentation/widgets/terms_and_policy_btn.dart';
import 'package:e_commerce_app/features/signup/presentation/bloc/signup_user_bloc.dart';
import 'package:e_commerce_app/features/signup/presentation/widgets/email_textfield.dart';
import 'package:e_commerce_app/features/signup/presentation/widgets/password_textfield.dart';
import 'package:e_commerce_app/features/signup/presentation/widgets/username_textfield.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
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
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AutoSizeText(
                      Constants.SIGNUP,
                      style: TextStyles.font31BlackBold,
                      maxLines: 1,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    CustomLoginAndForgotRow(
                      screenWidth: screenWidth,
                      isLoginScreen: false,
                      onpressed: () => context.push('/login'),
                    ),
                    SizedBox(height: screenHeight * 0.04),

                    // Email TextField
                    EmailTextField(email: email,),
                    SizedBox(height: screenHeight * 0.02),

                    // Username TextField
                    UserNameTextField(username: username),
                    SizedBox(height: screenHeight * 0.02),

                    // Password TextField
                    PasswordTextField(password: password),
                    SizedBox(height: screenHeight * 0.03),

                    // Sign Up Button
                    BlocConsumer<SignupUserBloc, SignupUserState>(
                      listener: (context, state) {
                        if (state.status == UserStatus.error) {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.warning,
                            animType: AnimType.bottomSlide,
                            title: Constants.ERROR,
                            desc: state.message,
                          ).show();
                        } else if (state.status == UserStatus.loaded) {
                          // Navigate to the home screen on success
                          context.pushReplacement('/home');
                        }
                      },
                      builder: (context, state) {
                        return SignUpLogInForgotBtn(
                          isLoginsbutton: false,
                          isResetButton: false,
                          isLoading: state.status == UserStatus.loading,
                          onpressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              context
                                  .read<SignupUserBloc>()
                                  .add(GetUserDataEvent(
                                    email: email.text.trim(),
                                    password: password.text.trim(),
                                  ));
                            }
                          },
                        );
                      },
                    ),

                    SizedBox(height: screenHeight * 0.02),
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
        ),
      ),
    );
  }
}