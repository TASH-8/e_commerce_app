 import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/core/theming/font_weight_helper.dart';
import 'package:flutter/material.dart';

Widget buildTab(
    String text,
    int page,
    double screenWidth,
    ValueNotifier<int> activePageNotifier,
    Function(int) onTabPressed,
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
              color: isActive ? ColorManger.white: ColorManger.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: isActive ? ColorManger.redAccent : ColorManger.black,
                  fontWeight: isActive ? FontWeightHelper.bold : FontWeightHelper.regular,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

