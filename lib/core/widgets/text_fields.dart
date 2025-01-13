import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/core/theming/text_styles.dart';
import 'package:flutter/material.dart';

class Textfields extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final bool isPassword;
  final double screenHeight;
  const Textfields(
      {super.key,
      required this.icon,
      required this.hintText,
      this.isPassword = false,
      required this.screenHeight});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: ColorManger.grey,
          size: screenHeight * 0.03,
        ),
        hintText: hintText,
        hintStyle: TextStyles.font17GreyNormal,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
