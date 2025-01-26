// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:e_commerce_app/core/theming/colors_manger.dart';
// import 'package:e_commerce_app/core/theming/text_styles.dart';
// import 'package:e_commerce_app/features/profile/presentation/widgets/order_profile_items.dart';
// import 'package:flutter/material.dart';

// class ActionsTile extends StatelessWidget {
//   const ActionsTile({
//     super.key,
//     required this.item,
//   });

//   final OrderItem item;

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: Icon(
//         item.icon,
//         color: ColorManger.greyCustomShade,
//       ),
//       title: AutoSizeText(
//         item.title,
//         style: TextStyles.font16CustomGreyBold,
//       ),
//       trailing: Container(
//         padding: const EdgeInsets.all(8),
//         decoration: const BoxDecoration(
//           shape: BoxShape.circle,
//           color: ColorManger.greyCustom,
//         ),
//         child: const Icon(
//           Icons.arrow_forward_ios,
//           size: 10,
//           color: ColorManger.customGrey2,
//         ),
//       ),
//     );
//   }
// }
import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/core/theming/text_styles.dart';
import 'package:e_commerce_app/features/profile/presentation/widgets/order_profile_items.dart';
import 'package:flutter/material.dart';

class ActionsTile extends StatelessWidget {
  const ActionsTile({
    super.key,
    required this.item,
  });

  final OrderItem item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        item.icon,
        color: ColorManger.greyCustomShade,
      ),
      title: AutoSizeText(
        item.title,
        style: TextStyles.font16CustomGreyBold,
      ),
      trailing: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: ColorManger.greyCustom,
        ),
        child: const Icon(
          Icons.arrow_forward_ios,
          size: 10,
          color: ColorManger.customGrey2,
        ),
      ),
    );
  }
}