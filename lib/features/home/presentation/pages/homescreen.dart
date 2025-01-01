import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/core/theming/text_styles.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/appbar_builder.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/categories_row.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/custom_items_row.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/custom_latest_section.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorManger.greyshade100,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: buildAppBar(
          screenWidth: screenWidth,
          screenHeight: screenHeight,
          backgroundColor: Colors.grey.shade100,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              Constants.CATEGORIES,
              maxLines: 1,
              style: TextStyles.font35CustomGreyBold,
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            const CategoriesRow(),
            SizedBox(
              height: screenHeight * 0.025,
            ),
            AutoSizeText(
              Constants.LATEST,
              maxLines: 1,
              style: TextStyles.font35CustomGreyBold,
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            const CustomLatestSection(),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            const CustomItemsRow()
          ],
        ),
      ),
    );
  }
}

