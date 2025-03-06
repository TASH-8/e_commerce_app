import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/core/widgets/text_fields.dart';
import 'package:flutter/material.dart';
class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
    required this.email,
  });

  final TextEditingController email;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Textfields(
      icon: Icons.email,
      hintText: Constants.EMAILTEXTHINT,
      screenHeight: screenHeight,
      controller: email,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return Constants.EMAIL_EMPTY;
        }
        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
          return Constants.EMAIL_INVALID;
        }
        return null;
      },
    );
  }
}
