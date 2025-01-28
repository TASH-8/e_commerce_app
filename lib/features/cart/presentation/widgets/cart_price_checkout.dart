import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/core/theming/text_styles.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/features/cart/presentation/blocs/bloc/cart_bloc.dart';
import 'package:e_commerce_app/features/cart/presentation/blocs/bloc/cart_state.dart';
import 'package:e_commerce_app/features/cart/presentation/widgets/checkout_btn.dart';
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
              Flexible(
                child: Column(
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
              ),
              const CheckoutBtn(),
            ],
          );
        },
      ),
    );
  }
}
