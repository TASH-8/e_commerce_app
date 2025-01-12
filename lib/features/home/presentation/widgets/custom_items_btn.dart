import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/theming/text_styles.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/features/product/presentation/bloc/product_bloc.dart';
import 'package:e_commerce_app/features/product/presentation/pages/product_preview_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomItemsBtn extends StatelessWidget {
  const CustomItemsBtn({
    super.key,
    required this.itemPicture,
    required this.itemName,
    required this.itemPrice,
  });
  final String itemPicture;
  final String itemName;
  final double itemPrice;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            context.read<ProductBloc>().add(
                  GetProductDetailEvent(
                    itemName: itemName,
                    itemPicture: itemPicture,
                    itemPrice: itemPrice,
                  ),
                );
            print(state.itemPicture);

            // Navigator.of(context).push(MaterialPageRoute(
            //     builder: (context) => const ProductPreviewScreen()));
          },
          child: Center(
            child: Container(
              width: screenWidth * 0.35,
              height: screenHeight * 0.2,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Image.asset(
                      width: screenWidth * 0.3,
                      height: screenHeight * 0.11,
                      itemPicture,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        itemName,
                        style: TextStyles.font14CustomGreyRegular,
                      ),
                      AutoSizeText(
                        "${Constants.DOLLARSIGN} $itemPrice",
                        style: TextStyles.font14CustomGreyBold,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
