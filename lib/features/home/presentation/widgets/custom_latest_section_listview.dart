import 'package:e_commerce_app/features/home/presentation/widgets/custom_latest_section_items.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/custom_second_listview_picture.dart';
import 'package:flutter/material.dart';

class CustomLatestSectionListView extends StatelessWidget {
  const CustomLatestSectionListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: const [CustomLatestSectionItems(), CustomSecondPicture()],
    );
  }
}
