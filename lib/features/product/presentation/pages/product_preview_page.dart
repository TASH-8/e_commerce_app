import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/features/product/presentation/pages/product_detail_review_page.dart';
import 'package:e_commerce_app/features/product/presentation/widgets/app_bar_builder.dart';
import 'package:e_commerce_app/features/product/presentation/widgets/items_pictures.dart';
import 'package:e_commerce_app/features/product/presentation/widgets/price_and_rating.dart';
import 'package:e_commerce_app/features/product/presentation/widgets/share_add_to_cart_btn.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductPreviewScreen extends StatelessWidget {
  const ProductPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: buildAppBar(screenWidth, context),
      backgroundColor: ColorManger.greyshade100,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // Price and Rating Section
                const PriceAndRating(),
                SizedBox(
                  height: screenHeight * 0.025,
                ),

                // Page Indicator
                SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect:  SlideEffect(
                    dotHeight: 7,
                    dotWidth: 7,
                    spacing: 6,
                    activeDotColor: ColorManger.blackCustom
                  ),
                ),

                // Product Image
                ItemsPicture(controller: controller),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                const ProductDetailsReviewSection(),
              ],
            ),
          ),
          const ShareAddtocartBTN()
        ],
      ),

    );
  }
}
