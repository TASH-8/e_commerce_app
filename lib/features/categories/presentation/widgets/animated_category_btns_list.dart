import 'package:e_commerce_app/core/app_images/app_images.dart';
import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/core/widgets/custom_category_btn.dart';
import 'package:flutter/material.dart';

class AnimatedCategoryButtonLists extends StatelessWidget {
  AnimatedCategoryButtonLists({
    super.key,
    required List<Animation<double>> scaleAnimations,
    required List<Animation<double>> fadeAnimations,
    required this.screenHeight,
  })  : _scaleAnimations = scaleAnimations,
        _fadeAnimations = fadeAnimations;

  final List<Animation<double>> _scaleAnimations;
  final List<Animation<double>> _fadeAnimations;
  final double screenHeight;

  // List of button data
  final List<List<dynamic>> _buttonsData = [
    [
      ColorManger.apparelGradient1,
      ColorManger.apparelGradient2,
      Assets.assetsApparelicon,
      Constants.APPAREL,
    ],
    [
      ColorManger.beautyGradient1,
      ColorManger.beautyGradient2,
      Assets.assetsBeautyicons,
      Constants.BEAUTY,
    ],
    [
      ColorManger.shoesGradient1,
      ColorManger.shoesGradient2,
      Assets.assetsShoesicon,
      Constants.SHOES,
    ],
    [
      ColorManger.electronicsGradient1,
      ColorManger.electronicsGradient2,
      Assets.assetsElectronics,
      Constants.ELECTRONICS,
    ],
    [
      ColorManger.furnitureGradient1,
      ColorManger.furnitureGradient2,
      Assets.assetsFurniture,
      Constants.FURNITURE,
    ],
    [
      ColorManger.homeGradient1,
      ColorManger.homeGradient2,
      Assets.assetsHome,
      Constants.HOME,
    ],
    [
      ColorManger.stationaryGradient1,
      ColorManger.stationaryGradient2,
      Assets.assetsStationary,
      Constants.STATIONARY,
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        _buttonsData.length,
        (index) {
          final buttonData = _buttonsData[index];

          return Column(
            children: [
              ScaleTransition(
                scale: _scaleAnimations[index],
                child: FadeTransition(
                  opacity: _fadeAnimations[index],
                  child: CustomCategoryButton(
                    grediantColor1: buttonData[0],
                    grediantColor2: buttonData[1],
                    assets: buttonData[2],
                    buttonCategorie: buttonData[3],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
            ],
          );
        },
      ),
    );
  }
}
