import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/features/product/presentation/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemsPicture extends StatelessWidget {
  const ItemsPicture({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state.status == ProductStatus.loaded) {
          return Container(
            padding: EdgeInsets.all(screenHeight * 0.025),
            height: screenHeight * 0.42,
            width: screenWidth,
            child: PageView(
              controller: controller,
              children: [
                Image.asset(state.itemPicture!),
                Image.asset(state.itemPicture!),
                Image.asset(state.itemPicture!)
              ],
            ),
          );
        } else {
          return const Center(
            child: Text(Constants.ERRRTOLOAD),
          );
        }
      },
    );
  }
}
