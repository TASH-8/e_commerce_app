import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/core/widgets/text_fields.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    required this.password,
  });

  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Textfields(
      icon: Icons.lock,
      hintText: Constants.PASSWORD,
      screenHeight: screenHeight,
      controller: password,
      isPassword: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return Constants.PASSWORD_EMPTY;
        }
        if (value.length < 6) {
          return Constants.PASSWORD_SHORT;
        }
        return null;
      },
    );
  }
}
