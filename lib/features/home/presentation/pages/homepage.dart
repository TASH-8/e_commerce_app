import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/theming/text_styles.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/appbar_builder.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/categories_row.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/custom_items_row.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/custom_latest_section_pictures.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/page_indicator.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/side_padding_custom_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final PageController controller = PageController(initialPage: 0);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: buildHomeScreenAppBar(
          backgroundColor: Colors.grey.shade100,
          context: context,
        ),
      ),
      body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SidesCustomPaddingWidget(
            child: AutoSizeText(
              Constants.CATEGORIES,
              maxLines: 1,
              style: TextStyles.font35CustomGreyBold,
            ),
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          const CategoriesRow(),
          SizedBox(
            height: screenHeight * 0.025,
          ),
          SidesCustomPaddingWidget(
            child: AutoSizeText(
              Constants.LATEST,
              maxLines: 1,
              style: TextStyles.font35CustomGreyBold,
            ),
          ),
          SizedBox(
            height: screenHeight * 0.01,
          ),
          LatestOffersPics(
            controller: controller,
          ),
          SizedBox(
            height: screenHeight * 0.012,
          ),
          PageIndicatorDots(
            controller: controller,
          ),
          SizedBox(
            height: screenHeight * 0.012,
          ),
          const CustomItemsRow(),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    ),
    );
  }
}
