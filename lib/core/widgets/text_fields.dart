import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/core/theming/text_styles.dart';
import 'package:flutter/material.dart';

class Textfields extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final bool isPassword;
  final double screenHeight;
  final TextEditingController? controller;
  final String? Function(String?)? validator; // ✅ Validator function

  const Textfields({
    super.key,
    required this.icon,
    required this.hintText,
    this.isPassword = false,
    required this.screenHeight,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    // State to toggle password visibility
    ValueNotifier<bool> isObscure = ValueNotifier<bool>(isPassword);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0), // Spacing for error text
      child: ValueListenableBuilder<bool>(
        valueListenable: isObscure,
        builder: (context, value, child) {
          return TextFormField(
            controller: controller,
            obscureText: value, // Use the state to toggle visibility
            autovalidateMode:
                AutovalidateMode.onUserInteraction, // ✅ Validate while typing
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
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none, // Default: no border
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(
                  color: ColorManger.grey,
                  width: 1,
                ), // Default gray border
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  color: ColorManger.blue,
                  width: 2,
                ), // Blue when selected
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  color: ColorManger.red,
                  width: 2,
                ), // ✅ Red border on error
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  color: ColorManger.red,
                  width: 2,
                ), // ✅ Red border when typing wrong
              ),
              // Conditionally show suffix icon for password fields
              suffixIcon: isPassword
                  ? IconButton(
                      icon: Icon(
                        value ? Icons.visibility_off : Icons.visibility,
                        color: ColorManger.grey,
                      ),
                      onPressed: () {
                        // Toggle password visibility
                        isObscure.value = !value;
                      },
                    )
                  : null, // No suffix icon if not a password field
            ),
            validator: validator,
          );
        },
      ),
    );
  }
}
