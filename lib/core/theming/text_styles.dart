import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/core/theming/font_weight_helper.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static const TextStyle font31BlackBold = TextStyle(
    fontSize: 31,
    fontWeight: FontWeightHelper.bold,
    color: ColorManger.black,
  );
  static const TextStyle font17redAccentBold = TextStyle(
    fontSize: 17.5,
    fontWeight: FontWeightHelper.bold,
    color: ColorManger.redAccent,
  );
    static const TextStyle font15redAccentBold = TextStyle(
    fontSize: 15,
    fontWeight: FontWeightHelper.bold,
    color: ColorManger.redAccent,
  );

  static const TextStyle font17GreyNormal = TextStyle(
    fontSize: 17.5,
    fontWeight: FontWeightHelper.regular,
    color: Colors.grey,
  );
    static const TextStyle font18WhiteBold = TextStyle(
    fontSize: 18,
    fontWeight: FontWeightHelper.bold,
    color: ColorManger.white,
  );
    static const TextStyle font15GreyNormal = TextStyle(
    fontSize: 15,
    fontWeight: FontWeightHelper.regular,
    color: Colors.grey,
  );
}
