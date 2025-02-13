import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/app_images/app_images.dart';
import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/core/theming/text_styles.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/appbar_builder.dart';
import 'package:e_commerce_app/features/product/presentation/widgets/side_custom_padding.dart';
import 'package:e_commerce_app/features/search/presentation/widgets/item_card.dart';
import 'package:e_commerce_app/features/search/presentation/widgets/recently_clear_btn.dart';
import 'package:e_commerce_app/features/search/presentation/widgets/recommended_items.dart';
import 'package:e_commerce_app/features/search/presentation/widgets/recommended_refresh_btn.dart';
import 'package:e_commerce_app/features/search/presentation/widgets/search_field.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: buildHomeScreenAppBar(
          backgroundColor: Colors.grey.shade100,
          context: context,
        ),
      ),
      backgroundColor: ColorManger.greyshade100,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SidesCustomPadding(
              child: AutoSizeText(
                Constants.search,
                style: TextStyles.font35CustomGreyBold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SearchField(),
            const SizedBox(
              height: 20,
            ),
            const RecentlyAndClearBtn(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ItemCard(
                      itemPic: Assets.assetsRedBackpack,
                      itemNameAndPrice: Constants.searchInfoBackpack,
                    ),
                    ItemCard(
                      itemPic: Assets.assetsScarfPNG25,
                      itemNameAndPrice: Constants.searchInfoScarf,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const RecommendedAndRefreshBtn(),
            const SizedBox(
              height: 10,
            ),
            const RecommendedItems()
          ],
        ),
      ),
    );
  }
}
