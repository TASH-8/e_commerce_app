import 'package:e_commerce_app/features/product/presentation/widgets/add_to_cart.dart';
import 'package:e_commerce_app/features/product/presentation/widgets/share_btn.dart';
import 'package:flutter/material.dart';

class ShareAddtocartBTN extends StatelessWidget {
  const ShareAddtocartBTN({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.02,
        vertical: screenHeight * 0.01,
      ),
      child: const Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // SHARETHIS Button
            ShareBtn(),
            // ADD TO CART Button
            AddToCartBtn(),
          ],
        ),
      ),
    );
  }
}
