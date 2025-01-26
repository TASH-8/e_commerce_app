import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/features/categories/presentation/widgets/items_list_preview.dart';
import 'package:flutter/material.dart';

class MenAndWomenApparel extends StatelessWidget {
  const MenAndWomenApparel({
    super.key,
    required this.clothingItems,
  });
  final List<String> clothingItems;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth * 0.6,
      decoration: BoxDecoration(
        color: ColorManger.white,
        borderRadius: BorderRadius.circular(14),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: ItemsListPreview(
        clothingItems: clothingItems,
      ),
    );
  }
}
