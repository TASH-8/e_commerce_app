import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/features/product/presentation/widgets/sizes.dart';
import 'package:flutter/material.dart';

class SizesSection extends StatelessWidget {
  const SizesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
      child: SizedBox(
          width: screenWidth,
          child: Wrap(
            children: List.generate(
              sizeList.length,
              (index) => Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: ColorManger.white,
                  ),
                  height: screenHeight * 0.05,
                  width: screenWidth * 0.2,
                  child: Center(
                    child: Text(sizeList[index]),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
