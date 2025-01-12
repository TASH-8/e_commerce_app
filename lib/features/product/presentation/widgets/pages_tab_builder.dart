// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/core/theming/font_weight_helper.dart';

Widget buildTab({
 required String text,
 required int page,
 required double screenWidth,
 required ValueNotifier<int> activePageNotifier,
 required Function(int) onTabPressed,}
) {
  return ValueListenableBuilder<int>(
    valueListenable: activePageNotifier,
    builder: (context, activePage, _) {
      final screenHeight = MediaQuery.of(context).size.height;
      bool isActive = activePage == page;
      return InkWell(
        onTap: () => onTabPressed(page),
        child: Container(
          width: screenWidth * 0.2,
          height: screenHeight * 0.033,
          decoration: BoxDecoration(
            color: isActive ? ColorManger.white : ColorManger.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: isActive ? ColorManger.redAccent : ColorManger.black,
                fontWeight:
                    isActive ? FontWeightHelper.bold : FontWeightHelper.regular,
                fontSize: 15,
              ),
            ),
          ),
        ),
      );
    },
  );
}

class NewWidget extends StatelessWidget {
  final String text;
  final int page;
  final double screenWidth;
  final ValueNotifier<int> activePageNotifier;
  final Function(int) onTabPressed;

  const NewWidget({
    super.key,
    required this.text,
    required this.page,
    required this.screenWidth,
    required this.activePageNotifier,
    required this.onTabPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: activePageNotifier,
      builder: (context, activePage, _) {
        final screenHeight = MediaQuery.of(context).size.height;
        bool isActive = activePage == page;
        return InkWell(
          onTap: () => onTabPressed(page),
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: screenWidth * 0.2,
            height: screenHeight * 0.033,
            decoration: BoxDecoration(
              color: isActive ? ColorManger.white : ColorManger.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: isActive ? ColorManger.redAccent : ColorManger.black,
                  fontWeight: isActive
                      ? FontWeightHelper.bold
                      : FontWeightHelper.regular,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
