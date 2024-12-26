import 'package:e_commerce_app/core/theming/text_styles.dart';
import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Center(
      child: InkWell(
        onTap: () {
          // Handle button press
          debugPrint("Sign Up button pressed");
        },
        child: Container(
          width: mediaQuery.size.width * 0.8, // Button width: 80% of screen
          height: mediaQuery.size.height * 0.07, // Button height: 7% of screen
          decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(50.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Spacer to balance the layout
              const SizedBox(width: 32), // Same as the right padding

              // Centered "SIGN UP" text
              const Text(
                "SIGN UP",
                style: TextStyles.font18WhiteBold
              ),

              // Arrow on the right
              Padding(
                padding: const EdgeInsets.only(right: 16.0), // Adjust padding
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.redAccent,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
