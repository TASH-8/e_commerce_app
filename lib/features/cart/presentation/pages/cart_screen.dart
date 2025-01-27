import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/app_images/app_images.dart';
import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/core/theming/text_styles.dart';
import 'package:e_commerce_app/features/cart/presentation/blocs/bloc/cart_bloc.dart';
import 'package:e_commerce_app/features/cart/presentation/blocs/bloc/cart_state.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/appbar_builder.dart';
import 'package:e_commerce_app/features/product/presentation/widgets/side_custom_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorManger.greyshade100,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SidesCustomPadding(
              child: AutoSizeText(
                "Cart",
                style: TextStyles.font35CustomGreyBold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SidesCustomPadding(
              child: Container(
                width: screenWidth * 0.9,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    if (state.status == CartStatus.loaded) {
                      return Row(
                        children: [
                          Container(
                            width: 125,
                            height: 125,
                            decoration: const BoxDecoration(
                              color: ColorManger.white,
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              state.itemPicture!,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                state.itemName!,
                                style: TextStyles.font16GreyNormal,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              AutoSizeText(
                                state.itemPrice!.toString(),
                                style: TextStyles.font16RedAccentNormal,
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      context
                                          .read<CartBloc>()
                                          .add(DecreameantEvent());
                                    },
                                    icon: const Icon(Icons.remove),
                                  ),
                                  BlocBuilder<CartBloc, CartState>(
                                    builder: (context, state) {
                                      // Simply display the quantity.
                                      return Text(
                                        "${state.quantity}",
                                        style: TextStyle(fontSize: 18),
                                      );
                                    },
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      context
                                          .read<CartBloc>()
                                          .add(IncrementEvent());
                                    },
                                    icon: const Icon(Icons.add),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      );
                    } else {
                      return Center(
                        child: Text("Cart is empty"),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

