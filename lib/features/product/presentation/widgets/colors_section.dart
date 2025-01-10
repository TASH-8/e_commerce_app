import 'package:e_commerce_app/features/product/presentation/widgets/color_containers.dart';
import 'package:flutter/material.dart';

class ColorsSection extends StatelessWidget {
  const ColorsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ColorContainers(),
        ],
      ),
    );
  }
}
