// Function to build the AppBar
import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

AppBar buildCatergoryAppBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.transparent,
    actions: [
      IconButton(
        onPressed: () {
        context.pop();
        },
        icon: const Icon(
          Icons.close,
          size: 33,
          color: ColorManger.redAccentCustom,
        ),
      )
    ],
  );
}
