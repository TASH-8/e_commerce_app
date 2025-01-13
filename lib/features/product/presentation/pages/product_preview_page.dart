import 'package:e_commerce_app/core/app_images/app_images.dart';
import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/features/product/presentation/pages/product_detail_review_page.dart';
import 'package:e_commerce_app/features/product/presentation/widgets/app_bar_builder.dart';
import 'package:e_commerce_app/features/product/presentation/widgets/price_and_rating.dart';
import 'package:e_commerce_app/features/product/presentation/widgets/share_add_btn.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductPreviewScreen extends StatelessWidget {
  const ProductPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: buildAppBar(screenWidth),
      backgroundColor: ColorManger.greyshade100,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
          ),
          child: Column(
            children: [
              // Price and Rating Section
              const PriceAndRating(),
              SizedBox(
                height: screenHeight * 0.025,
              ),
    
              // Page Indicator
              SmoothPageIndicator(
                controller: PageController(),
                count: 3,
                effect: const SlideEffect(
                  dotHeight: 7,
                  dotWidth: 7,
                  spacing: 6,
                ),
              ),
    
              // Product Image
              Image.asset(
                Assets.assetsBoots,
                height: screenHeight * 0.42,
                width: screenWidth * 0.73,
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              const ProductDetailsReviewSection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: ColorManger.greyshade100,
        child: const ShareAddtocartBTN(),
      ),
    );
  }
}
