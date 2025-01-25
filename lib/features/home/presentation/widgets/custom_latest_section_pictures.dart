import 'package:e_commerce_app/features/home/presentation/widgets/custom_latest_section_pageviewer.dart';
import 'package:flutter/material.dart';



// my code
// class CustomLatestSection extends StatelessWidget {
//   const CustomLatestSection({
//     super.key, required this.controller,
//   });
// final  controller ;
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//     return Center(
//       child: SizedBox(
//         width: screenWidth * 1,
//         height: screenHeight * 0.26,
//         child:   CustomLatestSectionListView(controller: controller ,),
//       ),
//     );
//   }
// }
 
//  ai code
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