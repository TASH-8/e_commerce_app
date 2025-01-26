import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/app_images/app_images.dart';
import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SeeAllBtn extends StatelessWidget {
  const SeeAllBtn({
    super.key,
    required this.buttonCategorie,
  });
  final String buttonCategorie;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double buttonSize = screenWidth * 0.2;
    return Column(
      children: [
        Center(
          child: InkWell(
            borderRadius: BorderRadius.circular(23),
            onTap: () => context.push('/categories'),
            child: Container(
              width: buttonSize,
              height: buttonSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [ColorManger.white, ColorManger.white],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: ColorManger.grey.withOpacity(0.3),
                    blurRadius: buttonSize * 0.15, // Dynamic blur radius
                    spreadRadius: buttonSize * 0.02,
                    offset: Offset(
                      buttonSize * 0.08,
                      buttonSize * 0.08,
                    ), // Bottom-right shadow
                  ),
                ],
              ),
              child: Center(
                child: SvgPicture.asset(
                  Assets.assetsArrowicon,
                  width: buttonSize * 0.3,
                  height: buttonSize * 0.3,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: screenHeight * 0.01,
        ),
        AutoSizeText(
          buttonCategorie,
          maxLines: 1,
          style: TextStyles.font16GreyNormal,
        ),
      ],
    );
  }
}
