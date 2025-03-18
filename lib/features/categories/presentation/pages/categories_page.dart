import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/core/theming/text_styles.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/features/categories/presentation/widgets/appbar_builder.dart';
import 'package:e_commerce_app/features/categories/presentation/widgets/categories_list.dart';
import 'package:e_commerce_app/features/categories/presentation/widgets/men_and_women_items_listpreview.dart';
import 'package:e_commerce_app/features/product/presentation/widgets/side_custom_padding.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorManger.greyshade100,
      appBar: buildCatergoryAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SidesCustomPadding(
              child: AutoSizeText(
                Constants.ALLCATOGORIES,
                maxLines: 1,
                style: TextStyles.font35CustomGreyBold,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CategoriesList(),
                SizedBox(width: screenWidth * 0.05),
                const MenAndWomenListPreview(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
