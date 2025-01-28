import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/core/theming/text_styles.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/features/cart/presentation/blocs/bloc/cart_bloc.dart';
import 'package:e_commerce_app/features/cart/presentation/blocs/bloc/cart_state.dart';
import 'package:e_commerce_app/features/product/presentation/widgets/custom_icon_for_share_add_btns.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPriceAndCheckout extends StatelessWidget {
  const CartPriceAndCheckout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: ColorManger.greyshade100,
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
        vertical: screenHeight * 0.02,
      ),
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AutoSizeText(
                    Constants.TOTAL,
                    style: TextStyle(
                      fontSize: 12,
                      color: ColorManger.greyCustom,
                    ),
                  ),
                  Text(
                    '\$${state.totalPrice.toStringAsFixed(2)}',
                    style: TextStyles.font25GreyCustomShadeBold,
                  ),
                  AutoSizeText(
                    Constants.FREE_SHIPPING,
                    style: TextStyles.font14GreyCustomShadeLight,
                  ),
                ],
              ),
              CheckoutBtn(),
            ],
          );
        },
      ),
    );
  }
}

class CheckoutBtn extends StatelessWidget {
  const CheckoutBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Flexible(
      child: Container(
        height: screenHeight * 0.057,
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.02,
        ),
        decoration: BoxDecoration(
          color: ColorManger.redAccentCustom,
          borderRadius: BorderRadius.circular(screenWidth * 0.075),
          boxShadow: [
            BoxShadow(
              color: ColorManger.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: screenWidth * 0.015,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Flexible(
              child: AutoSizeText(
                Constants.CHECKOUT,
                style: TextStyles.font16WhiteExtraBoldSpacingHalf,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(width: screenWidth * 0.02),
            CustomIcon(
              icon: Icons.arrow_forward_ios,
              iconColor: ColorManger.redAccentCustom,
              iconBackgroundColor: ColorManger.white,
              screenWidth: screenWidth,
              screenHeight: screenHeight,
            ),
          ],
        ),
      ),
    );
  }
}
