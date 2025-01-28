import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/features/cart/presentation/widgets/cart_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/core/theming/text_styles.dart';
import 'package:e_commerce_app/features/cart/presentation/blocs/bloc/cart_bloc.dart';
import 'package:e_commerce_app/features/cart/presentation/blocs/bloc/cart_state.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state.status == CartStatus.loaded && state.items.isNotEmpty) {
          return SizedBox(
            height: screenHeight * 0.7,
            child: ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                final item = state.items[index];
                return CartItems(
                  item: item,
                  index: index,
                  state: state,
                );
              },
            ),
          );
        } else {
          return SizedBox(
            width: double.infinity,
            height: screenHeight * 0.8,
            child: Center(
              child: AutoSizeText(
                Constants.CARTISEMPTY,
                style: TextStyles.font35CustomGreyBold,
              ),
            ),
          );
        }
      },
    );
  }
}
