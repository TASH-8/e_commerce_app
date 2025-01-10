import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/features/product/presentation/widgets/detail_section.dart';
import 'package:e_commerce_app/features/product/presentation/widgets/pages_tab_builder.dart';
import 'package:e_commerce_app/features/product/presentation/widgets/product_section.dart';
import 'package:e_commerce_app/features/product/presentation/widgets/reviews_section.dart';
import 'package:flutter/material.dart';

class ProductDetailsReviewSection extends StatelessWidget {
  const ProductDetailsReviewSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final ValueNotifier<int> activePageNotifier = ValueNotifier<int>(0);
    final PageController pageController = PageController(initialPage: 0);

    void onPageChanged(int page) {
      activePageNotifier.value = page;
    }

    void onTabPressed(int page) {
      pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildTab(Constants.PRODUCT, 0, screenWidth, activePageNotifier,
                onTabPressed),
            buildTab(Constants.DETAILS, 1, screenWidth, activePageNotifier,
                onTabPressed),
            buildTab(Constants.REVIEW, 2, screenWidth, activePageNotifier,
                onTabPressed),
          ],
        ),
        SizedBox(
          width: screenWidth,
          height: screenHeight * 0.3,
          child: PageView(
            physics:
                const NeverScrollableScrollPhysics(), // Disable user scrolling
            controller: pageController,
            onPageChanged: onPageChanged,
            children: const [
              ProductSection(),
              DetailsSection(),
              ReviewsSection(),
            ],
          ),
        ),
      ],
    );
  }
}
