import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/core/theming/text_styles.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/features/product/presentation/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PriceAndRating extends StatelessWidget {
  const PriceAndRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state.status == ProductStatus.loaded) {
                return AutoSizeText(
                  "${Constants.DOLLARSIGN}${state.itemPrice}",
                  style: TextStyles.font17GCustomGreyExtraBold,
                  maxLines: 1,
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
        SizedBox(width: screenWidth * 0.02),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
          decoration: BoxDecoration(
            color: ColorManger.redAccent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.star,
                color: ColorManger.white,
                size: screenWidth * 0.04,
              ),
              const SizedBox(width: 4),
              const Flexible(
                child: AutoSizeText(
                  "${Constants.BOOT_RATING}",
                  style: TextStyles.font14WhiteExtraBold,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
