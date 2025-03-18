// ignore_for_file: library_private_types_in_public_api

import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/features/profile/presentation/widgets/actions_tile.dart';
import 'package:e_commerce_app/features/profile/presentation/widgets/order_profile_items.dart';
import 'package:flutter/material.dart';

class CustomListTilesActions extends StatefulWidget {
  final List<OrderAndMoreItems> items;

  const CustomListTilesActions({
    super.key,
    required this.items,
  });

  @override
  _CustomListTilesActionsState createState() => _CustomListTilesActionsState();
}

class _CustomListTilesActionsState extends State<CustomListTilesActions>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<Offset>> _slideAnimations;
  late List<Animation<double>> _fadeAnimations;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller with a longer duration
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000), // Slower animation
    );

    // Define staggered animations for each item
    _slideAnimations = List.generate(
      widget.items.length,
      (index) => Tween<Offset>(
        begin: const Offset(-1, 0), // Slide from the left
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(
            index * 0.2, // Increased staggered delay
            1.0,
            curve: Curves.easeOut,
          ),
        ),
      ),
    );

    _fadeAnimations = List.generate(
      widget.items.length,
      (index) => Tween<double>(
        begin: 0.0, // Start fully transparent
        end: 1.0, // End fully opaque
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(
            index * 0.2, // Increased staggered delay
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
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth * 0.9,
      decoration: BoxDecoration(
        color: ColorManger.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          final item = widget.items[index];
          return SlideTransition(
            position: _slideAnimations[index],
            child: FadeTransition(
              opacity: _fadeAnimations[index],
              child: Column(
                children: [
                  ActionsTile(item: item),
                  if (index < widget.items.length - 1)
                    const Divider(
                      thickness: 0.5,
                      indent: 16,
                      endIndent: 16,
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
