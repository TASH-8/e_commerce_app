import 'package:e_commerce_app/core/app_images/app_images.dart';
import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/core/widgets/custom_category_btn.dart';
import 'package:e_commerce_app/features/product/presentation/widgets/side_custom_padding.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: screenHeight * 0.8, // Constrain height
      ),
      child: SingleChildScrollView(
        child: SidesCustomPadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align to the left
            children: [
              const CustomCategoryButton(
                grediantColor1: ColorManger.apparelGradient1,
                grediantColor2: ColorManger.apparelGradient2,
                assets: Assets.assetsApparelicon,
                buttonCategorie: Constants.APPAREL,
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              const CustomCategoryButton(
                grediantColor1: ColorManger.beautyGradient1,
                grediantColor2: ColorManger.beautyGradient2,
                assets: Assets.assetsBeautyicons,
                buttonCategorie: Constants.BEAUTY,
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              const CustomCategoryButton(
                grediantColor1: ColorManger.shoesGradient1,
                grediantColor2: ColorManger.shoesGradient2,
                assets: Assets.assetsShoesicon,
                buttonCategorie: Constants.SHOES,
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              const CustomCategoryButton(
                grediantColor1: ColorManger.electronicsGradient1,
                grediantColor2: ColorManger.electronicsGradient2,
                assets: Assets.assetsElectronics,
                buttonCategorie: Constants.ELECTRONICS,
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              const CustomCategoryButton(
                grediantColor1: ColorManger.furnitureGradient1,
                grediantColor2: ColorManger.furnitureGradient2,
                assets: Assets.assetsFurniture,
                buttonCategorie: Constants.FURNITURE,
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              const CustomCategoryButton(
                grediantColor1: ColorManger.homeGradient1,
                grediantColor2: ColorManger.homeGradient2,
                assets: Assets.assetsHome,
                buttonCategorie: Constants.HOME,
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              const CustomCategoryButton(
                grediantColor1: ColorManger.stationaryGradient1,
                grediantColor2: ColorManger.stationaryGradient2,
                assets: Assets.assetsStationary,
                buttonCategorie: Constants.STATIONARY,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
