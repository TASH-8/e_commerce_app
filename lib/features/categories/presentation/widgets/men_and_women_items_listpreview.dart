import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/theming/text_styles.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/features/categories/presentation/widgets/items.dart';
import 'package:e_commerce_app/features/categories/presentation/widgets/men_apparells.dart';
import 'package:flutter/material.dart';

class MenAndWomenListPreview extends StatelessWidget {
  const MenAndWomenListPreview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Expanded(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: screenHeight * 0.8, // Constrain height
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AutoSizeText(
                Constants.MENAPPAREL,
                style: TextStyles.font17GreyBold,
              ),
              SizedBox(height: screenHeight * 0.01),
              MenAndWomenApparel(
                clothingItems: men_clothing_items,
              ), // Scrollable Men's Apparel
              SizedBox(height: screenHeight * 0.02),
              const Divider(
                thickness: 0.5,
              ),
              SizedBox(height: screenHeight * 0.02),
              const AutoSizeText(
                Constants.WOMENAPPAREL,
                style: TextStyles.font17GreyBold,
              ),
              SizedBox(height: screenHeight * 0.01),
              MenAndWomenApparel(
                clothingItems: women_clothing_items,
              ), // Scrollable Women's Apparel
            ],
          ),
        ),
      ),
    );
  }
}
