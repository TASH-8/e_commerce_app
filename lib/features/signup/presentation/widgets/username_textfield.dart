import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/core/widgets/text_fields.dart';
import 'package:flutter/material.dart';

class UserNameTextField extends StatelessWidget {
  const UserNameTextField({
    super.key,
    required this.username,
  });

  final TextEditingController username;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Textfields(
      icon: Icons.person,
      hintText: Constants.USER123,
      screenHeight: screenHeight,
      controller: username,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return Constants.USERNAME_EMPTY;
        }
        if (value.length < 3) {
          return Constants.USERNAME_SHORT;
        }
        return null;
      },
    );
  }
}
