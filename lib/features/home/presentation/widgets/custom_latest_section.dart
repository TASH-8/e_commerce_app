import 'package:e_commerce_app/features/home/presentation/widgets/custom_latest_section_listview.dart';
import 'package:flutter/material.dart';

class CustomLatestSection extends StatelessWidget {
  const CustomLatestSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: screenWidth * 0.9,
      height: screenHeight * 0.26,
      child: const CustomLatestSectionListView(),
    );
  }
}
