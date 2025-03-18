// ignore_for_file: library_private_types_in_public_api

import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/core/theming/text_styles.dart';
import 'package:e_commerce_app/features/product/presentation/widgets/side_custom_padding.dart';
import 'package:e_commerce_app/features/search/presentation/widgets/recommened_items_list.dart';
import 'package:flutter/material.dart';

class RecommendedItems extends StatefulWidget {
  const RecommendedItems({
    super.key,
  });

  @override
  _RecommendedItemsState createState() => _RecommendedItemsState();
}

class _RecommendedItemsState extends State<RecommendedItems>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    // Define the opacity animation
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    // Define the scale animation
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SidesCustomPadding(
      child: Wrap(
        children: [
          ...List.generate(
            recommendedSearchItems.length,
            (index) => AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Opacity(
                  opacity: _opacityAnimation.value,
                  child: Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: ColorManger.white,
                          ),
                          height: screenHeight * 0.05,
                          width: screenWidth * 0.2,
                          child: Center(
                            child: AutoSizeText(
                              recommendedSearchItems[index],
                              style: TextStyles.font14CustomGreyRegular,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}