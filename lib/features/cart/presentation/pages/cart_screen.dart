import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/core/theming/text_styles.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/features/cart/presentation/blocs/bloc/cart_bloc.dart';
import 'package:e_commerce_app/features/cart/presentation/blocs/bloc/cart_state.dart';
import 'package:e_commerce_app/features/cart/presentation/widgets/cart_list.dart';
import 'package:e_commerce_app/features/cart/presentation/widgets/cart_price_checkout.dart';
import 'package:e_commerce_app/features/cart/presentation/widgets/loading_diolog.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/appbar_builder.dart';
import 'package:e_commerce_app/features/product/presentation/widgets/side_custom_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartBloc, CartState>(
      listener: (context, state) {
        if (state.status == CartStatus.orderLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const LoadingAlertDialog(),
          );
        } else if (state.status == CartStatus.orderSuccess) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.messege),
            ),
          );
        } else if (state.status == CartStatus.orderError) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.messege),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: buildHomeScreenAppBar(
            backgroundColor: Colors.grey.shade100,
            context: context,
          ),
        ),
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
      ),
    );
  }
}
