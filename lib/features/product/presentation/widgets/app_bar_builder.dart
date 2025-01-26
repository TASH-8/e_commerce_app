import 'package:e_commerce_app/features/product/presentation/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/core/theming/text_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// / Function that builds and returns the AppBar
AppBar buildAppBar(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.transparent,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Back Button
        IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: screenWidth * 0.075,
          ),
          color: ColorManger.redAccent,
          onPressed: () {
            context.pop('/');
          },
        ),

        // Title
        Flexible(
          child: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state.status == ProductStatus.loaded) {
                return AutoSizeText(
                  state.itemName!,
                  style: TextStyles.font18CustomGreyLight,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                );
              } else {
                return const Center(
                  child: Text("erro"),
                );
              }
            },
          ),
        ),

        // Cart Icon
        Icon(
          Icons.shopping_cart_outlined,
          size: screenWidth * 0.075,
          color: ColorManger.grey,
        ),
      ],
    ),
  );
}
