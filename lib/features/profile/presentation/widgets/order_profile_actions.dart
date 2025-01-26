import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/features/profile/presentation/widgets/actions_tile.dart';
import 'package:e_commerce_app/features/profile/presentation/widgets/order_profile_items.dart';
import 'package:flutter/material.dart';

class OrderProfileActions extends StatefulWidget {
  final List<OrderItem> orderItems;

  const OrderProfileActions({
    super.key,
    required this.orderItems,
  });

  @override
  _OrderProfileActionsState createState() => _OrderProfileActionsState();
}

class _OrderProfileActionsState extends State<OrderProfileActions>
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
      widget.orderItems.length,
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
      widget.orderItems.length,
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
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.orderItems.length,
        itemBuilder: (context, index) {
          final item = widget.orderItems[index];
          return SlideTransition(
            position: _slideAnimations[index],
            child: FadeTransition(
              opacity: _fadeAnimations[index],
              child: Column(
                children: [
                  ActionsTile(item: item),
                  if (index < widget.orderItems.length - 1)
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
