import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/core/widgets/signup_login_btn_forgot.dart';
import 'package:e_commerce_app/features/forget_password/presentation/bloc/user_forget_bloc.dart';
import 'package:e_commerce_app/features/signup/presentation/widgets/email_textfield.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/theming/text_styles.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/features/forget_password/presentation/widgets/terms_and_policy_btn.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController email = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManger.greyshade100,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.undo),
        ),
      ),
      backgroundColor: ColorManger.greyshade100,
      body: BlocConsumer<UserForgetBloc, UserForgetState>(
        listener: (context, state) {
          if (state.status == UserForgetStatus.error) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.warning,
              animType: AnimType.bottomSlide,
              title: Constants.ERROR,
              desc: state.messege,
            ).show();
          } else if (state.status == UserForgetStatus.success) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              animType: AnimType.bottomSlide,
              title: Constants.SUCCESS,
              desc: state.messege,
            ).show();
          }
        },
        builder: (context, state) {
          return Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const AutoSizeText(
                        Constants.FORGOT_PASSWORD,
                        style: TextStyles.font31BlackBold,
                        maxLines: 1,
                      ),
                      SizedBox(height: screenHeight * 0.08),

                      const AutoSizeText(
                        Constants.FORGOT_PASSWORD_INFO,
                        style: TextStyles.font15GreyNormal,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                      SizedBox(height: screenHeight * 0.04),

                      EmailTextField(email: email),
                      SizedBox(height: screenHeight * 0.03),

                      SignUpLogInForgotBtn(
                        isLoginsbutton: false,
                        isResetButton: true,
                        isLoading: state.status == UserForgetStatus.loading,
                        onpressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<UserForgetBloc>().add(
                                  GetUserForgetEvent(email: email.text),
                                );
                          }
                        },
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
        },
      ),
    );
  }
}
