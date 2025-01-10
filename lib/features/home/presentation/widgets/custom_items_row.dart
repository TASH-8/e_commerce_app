import 'package:e_commerce_app/core/app_images/app_images.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/custom_items_btn.dart';
import 'package:flutter/material.dart';

class CustomItemsRow extends StatelessWidget {
  const CustomItemsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CustomItemsBtn(
            itemPicture: Assets.assetsWomenShoesPNG7464,
            itemName: Constants.ANKLE_BOOTS,
            itemPrice: Constants.BOOT_PRICE,
          ),
          SizedBox(
            width: 5,
          ),
          CustomItemsBtn(
            itemPicture: Assets.assetsBackpackPNG6354,
            itemName: Constants.BACKPACK,
            itemPrice: Constants.BACKPACK_PRICE,
          ),
          SizedBox(
            width: 5,
          ),
          CustomItemsBtn(
            itemPicture: Assets.assetsScarfPNG48,
            itemName: Constants.RED_SCARF,
            itemPrice: Constants.SCARF_PRICE,
          )
        ],
      ),
    );
  }
}
