import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/core/theming/text_styles.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/features/more/presentation/widgets/more_actions_lists.dart';
import 'package:e_commerce_app/features/product/presentation/widgets/side_custom_padding.dart';
import 'package:e_commerce_app/core/widgets/custom_list_tile_actions.dart';
import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen height using MediaQuery
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorManger.greyshade100,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SidesCustomPadding(
              child: AutoSizeText(
                Constants.MORE,
                style: TextStyles.font35CustomGreyBold,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.03, // 3% of screen height
            ),
            SidesCustomPadding(
              child: CustomListTilesActions(
                items: moreItems1,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02, // 2% of screen height
            ),
            SidesCustomPadding(
              child: CustomListTilesActions(
                items: moreItems2,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.03, // 3% of screen height
            ),
            Center(
              child: TextButton(
                onPressed: () {},
                child: const AutoSizeText(
                  Constants.LOGOUT,
                  textAlign: TextAlign.center,
                  style: TextStyles.font16RedAccentNormal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
