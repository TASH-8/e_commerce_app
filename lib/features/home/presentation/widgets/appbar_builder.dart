import 'package:flutter/material.dart';

Widget buildHomeScreenAppBar({
  required double screenWidth,
  required double screenHeight,
  required Color backgroundColor,
}) {
  return AppBar(
    backgroundColor: backgroundColor,
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
