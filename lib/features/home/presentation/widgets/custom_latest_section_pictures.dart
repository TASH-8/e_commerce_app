import 'package:e_commerce_app/features/home/presentation/widgets/custom_latest_section_pageviewer.dart';
import 'package:flutter/material.dart';

class LatestOffersPics extends StatelessWidget {
  const LatestOffersPics({
    super.key,
    required this.controller,
  });
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight * 0.26, // Adjust height proportionally
      child: LatestSectionPicsPageView(controller: controller),
    );
  }
}
