
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCategoryButton extends StatelessWidget {
  const CustomCategoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    final double buttonSize = screenWidth * 0.2; 

    return Column(
      children: [
        Center(
          child: Container(
            width: buttonSize,
            height: buttonSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF79E1F4), // Light turquoise
                  Color(0xFF3DA6F0), // Deeper blue
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF79E1F4).withOpacity(0.5),
                  blurRadius: buttonSize * 0.15, 
                  spreadRadius: buttonSize * 0.02,
                  offset: Offset(
                      -buttonSize * 0.1, -buttonSize * 0.1), // Top-left glow
                ),
                BoxShadow(
                  color: const Color(0xFF3DA6F0).withOpacity(0.3),
                  blurRadius: buttonSize * 0.15, // Dynamic blur radius
                  spreadRadius: buttonSize * 0.02,
                  offset: Offset(buttonSize * 0.1,
                      buttonSize * 0.1), // Bottom-right shadow
                ),
              ],
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/icons/beauty_icons',
                width: buttonSize * 0.6, 
                height: buttonSize * 0.65,
              ),
            ),
          ),
        ),
        const Text("fashoin")
      ],
    );
  }
}
