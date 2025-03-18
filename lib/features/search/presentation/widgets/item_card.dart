// ignore_for_file: library_private_types_in_public_api

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatefulWidget {
  const ItemCard({
    super.key,
    required this.itemPic,
    required this.itemNameAndPrice,
  });

  final String itemPic;
  final String itemNameAndPrice;

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    // Define the opacity animation
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    // Define the slide animation
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5), // Start from slightly below
      end: Offset.zero, // End at the original position
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
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

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: Transform.translate(
            offset: _slideAnimation.value,
            child: SizedBox(
              height: screenHeight * 0.08,
              width: screenWidth * 0.6,
              child: Card(
                color: Colors.white,
                child: ListTile(
                  leading: Image.asset(widget.itemPic),
                  title: AutoSizeText(widget.itemNameAndPrice),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
