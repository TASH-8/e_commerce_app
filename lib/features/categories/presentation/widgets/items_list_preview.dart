import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:flutter/material.dart';

class ItemsListPreview extends StatelessWidget {
  const ItemsListPreview({
    super.key,
    required this.clothingItems,
  });
  final List<String> clothingItems;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true, // Allow ListView to shrink-wrap its content
      physics: const NeverScrollableScrollPhysics(), // Disable scrolling
      itemCount: clothingItems.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      clothingItems[index], // Dynamically display the item name
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                      overflow: TextOverflow.ellipsis, // Handle overflow
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorManger.greyCustom,
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      size: 10,
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 0.5,
              ), // Add a divider below each item
            ],
          ),
        );
      },
    );
  }
}
