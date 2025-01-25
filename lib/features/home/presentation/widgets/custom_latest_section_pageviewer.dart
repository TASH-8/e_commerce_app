import 'package:e_commerce_app/features/home/presentation/widgets/custom_latest_section_first_pic.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/custom_second_pic.dart';
import 'package:flutter/material.dart';
// my code

class LatestSectionPicsPageView extends StatelessWidget {
  const LatestSectionPicsPageView({
    super.key,
    required this.controller,
  });
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return PageView(
      controller: controller,
      scrollDirection: Axis.horizontal,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
          child: const CustomFirstPicture(),
        ),
        const CustomSecondPicture(),
      ],
    );
  }
}

 // ai code
// class CustomLatestSectionListView extends StatelessWidget {
//   const CustomLatestSectionListView({
//     super.key,
//     required this.controller,
//   });
//   final PageController controller;

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     return PageView(
//       controller: controller,
//       scrollDirection: Axis.horizontal,
//       children: [
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
//           child: const CustomLatestSectionItems(),
//         ),
//         const CustomSecondPicture(),
//       ],
//     );
//   }
// }