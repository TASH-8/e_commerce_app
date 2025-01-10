import 'package:e_commerce_app/features/product/presentation/widgets/sizes.dart';
import 'package:flutter/material.dart';

class SizesSection extends StatelessWidget {
  const SizesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizeContainers(),
        ],
      ),
    );
  }
}
