import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:flutter/material.dart';

Widget buildHomeScreenAppBar({
  required Color backgroundColor,
  required BuildContext context,
}) {
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;
  return AppBar(
        automaticallyImplyLeading: false,

    backgroundColor: ColorManger.transparent,
    actions: [
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: screenHeight * 0.012,
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_active_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.message_outlined),
            ),
          ],
        ),
      ),
    ],
  );
}
