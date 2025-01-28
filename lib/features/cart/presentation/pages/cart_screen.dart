import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/core/theming/text_styles.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/features/cart/presentation/widgets/cart_list.dart';
import 'package:e_commerce_app/features/cart/presentation/widgets/cart_price_checkout.dart';
import 'package:e_commerce_app/features/product/presentation/widgets/side_custom_padding.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.greyshade100,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SidesCustomPadding(
                    child: AutoSizeText(
                      Constants.CART,
                      style: TextStyles.font35CustomGreyBold,
                    ),
                  ),
                  const CartList(),
                ],
              ),
            ),
          ),
          const CartPriceAndCheckout(),
        ],
      ),
    );
  }
}
