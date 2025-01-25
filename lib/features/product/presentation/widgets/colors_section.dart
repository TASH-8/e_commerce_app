import 'package:e_commerce_app/features/product/presentation/widgets/color_containers.dart';
import 'package:flutter/material.dart';

class ColorsSection extends StatelessWidget {
  const ColorsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
      child:  ColorsContainers(screenWidth: screenWidth),
    );
  }
}

