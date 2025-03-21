import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/features/product/presentation/widgets/detail_section.dart';
import 'package:e_commerce_app/features/product/presentation/widgets/pages_tab_builder.dart';
import 'package:e_commerce_app/features/product/presentation/widgets/product_section.dart';
import 'package:e_commerce_app/features/product/presentation/widgets/reviews_section.dart';
import 'package:e_commerce_app/features/product/presentation/widgets/side_custom_padding.dart';
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
        SidesCustomPadding(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PagesTabBuilder(
                text: Constants.PRODUCT,
                page: 0,
                screenWidth: screenWidth,
                activePageNotifier: activePageNotifier,
                onTabPressed: onTabPressed,
              ),
              PagesTabBuilder(
                text: Constants.DETAILS,
                page: 1,
                screenWidth: screenWidth,
                activePageNotifier: activePageNotifier,
                onTabPressed: onTabPressed,
              ),
              PagesTabBuilder(
                text: Constants.REVIEW,
                page: 2,
                screenWidth: screenWidth,
                activePageNotifier: activePageNotifier,
                onTabPressed: onTabPressed,
              ),
            ],
          ),
        ),
        SizedBox(
          width: screenWidth,
          height: screenHeight * 0.3,
          child: PageView(
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
