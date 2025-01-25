import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/theming/colors_manger.dart';

class PageIndicatorDots extends StatelessWidget {
  const PageIndicatorDots({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Center(
        child: SmoothPageIndicator(
      effect: SlideEffect(
        dotWidth: 10,
        dotHeight: 10,
        activeDotColor: ColorManger.blackCustom,
        spacing: screenWidth * 0.04,
        type: SlideType.slideUnder,
      ),
      controller: controller,
      count: 2,
      onDotClicked: (index) {
        controller.animateToPage(
          index,
          duration: const Duration(milliseconds: 200),
          curve: Curves.linear,
        );
      },
    ));
  }
}
