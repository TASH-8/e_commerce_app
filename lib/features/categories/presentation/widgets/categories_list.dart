import 'package:e_commerce_app/features/categories/presentation/widgets/animated_category_btns_list.dart';
import 'package:e_commerce_app/features/product/presentation/widgets/side_custom_padding.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({
    super.key,
  });

  @override
  _CategoriesListState createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _scaleAnimations;
  late List<Animation<double>> _fadeAnimations;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    // Define staggered animations for each button
    _scaleAnimations = List.generate(
      7, // Number of buttons
      (index) => Tween<double>(
        begin: 0.5, // Start scaled down
        end: 1.0, // End at normal size
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(
            index * 0.1, // Staggered delay
            1.0,
            curve: Curves.elasticOut, // Bouncy scaling effect
          ),
        ),
      ),
    );

    _fadeAnimations = List.generate(
      7, // Number of buttons
      (index) => Tween<double>(
        begin: 0.0, // Start fully transparent
        end: 1.0, // End fully opaque
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(
            index * 0.1, // Staggered delay
            1.0,
            curve: Curves.easeOut,
          ),
        ),
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
    final screenHeight = MediaQuery.of(context).size.height;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: screenHeight * 0.8, // Constrain height
      ),
      child: SingleChildScrollView(
        child: SidesCustomPadding(
          child: AnimatedCategoryButtonLists(
            scaleAnimations: _scaleAnimations,
            fadeAnimations: _fadeAnimations,
            screenHeight: screenHeight,
          ),
        ),
      ),
    );
  }
}
