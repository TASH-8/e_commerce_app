import 'package:e_commerce_app/core/app_images/app_images.dart';
import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/custom_category_btn.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/see_all_btn.dart';
import 'package:flutter/material.dart';

class CategoriesRow extends StatelessWidget {
  const CategoriesRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomCategoryButton(
          grediantColor1: ColorManger.orangeFade,
          grediantColor2: ColorManger.redFade,
          assets: Assets.assetsApparelicon,
          buttonCategorie: Constants.APPAREL,
        ),
        SizedBox(
          width: screenWidth * 0.05,
        ),
        CustomCategoryButton(
          grediantColor1: ColorManger.lightTurquoiseFade,
          grediantColor2: ColorManger.oeeperBlueFade,
          assets: Assets.assetsBeautyicons,
          buttonCategorie: Constants.BEAUTY,
        ),
        SizedBox(
          width: screenWidth * 0.05,
        ),
        CustomCategoryButton(
          grediantColor1: ColorManger.greenFade,
          grediantColor2: ColorManger.deeperGreenFade,
          assets: Assets.assetsShoesicon,
          buttonCategorie: Constants.SHOES,
        ),
        SizedBox(
          width: screenWidth * 0.05,
        ),
        const Flexible(
          child: SeeAllBtn(
            buttonCategorie: Constants.SEEALL,
          ),
        ),
      ],
    );
  }
}
