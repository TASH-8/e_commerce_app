import 'package:e_commerce_app/core/app_images/app_images.dart';
import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/core/widgets/custom_category_btn.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/see_all_btn.dart';
import 'package:flutter/material.dart';

class CategoriesRow extends StatelessWidget {
  const CategoriesRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const CustomCategoryButton(
              grediantColor1: ColorManger.apparelGradient1,
              grediantColor2: ColorManger.apparelGradient2,
              assets: Assets.assetsApparelicon,
              buttonCategorie: Constants.APPAREL,
            ),
            SizedBox(width: screenWidth * 0.05),
            const CustomCategoryButton(
              grediantColor1: ColorManger.beautyGradient1,
              grediantColor2: ColorManger.beautyGradient2,
              assets: Assets.assetsBeautyicons,
              buttonCategorie: Constants.BEAUTY,
            ),
            SizedBox(width: screenWidth * 0.05),
            const CustomCategoryButton(
              grediantColor1: ColorManger.shoesGradient1,
              grediantColor2: ColorManger.shoesGradient2,
              assets: Assets.assetsShoesicon,
              buttonCategorie: Constants.SHOES,
            ),
            SizedBox(width: screenWidth * 0.05),
            const SeeAllBtn(
              buttonCategorie: Constants.SEEALL,
            ),
          ],
        ),
      ),
    );
  }
}
