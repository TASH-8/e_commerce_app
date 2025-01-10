import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/theming/text_styles.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/features/product/presentation/widgets/colors_section.dart';
import 'package:e_commerce_app/features/product/presentation/widgets/sizes_section.dart';
import 'package:flutter/material.dart';

class ProductSection extends StatelessWidget {
  const ProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // "Select Color" Section
            const AutoSizeText(
              Constants.SELECTCOLOR,
              style: TextStyles.font17GreyBold,
            ),
            SizedBox(height: screenHeight * 0.01),

            // Colors Section
            const ColorsSection(),

            SizedBox(height: screenHeight * 0.02),

            // "Select Size" Section
            const AutoSizeText(
              Constants.SELECTSIZEUS,
              style: TextStyles.font17GreyBold,
            ),
            SizedBox(height: screenHeight * 0.01),

            // Sizes Section
            const SizesSection(),

            SizedBox(height: screenHeight * 0.05),
          ],
        ),
      ),
    );
  }
}
