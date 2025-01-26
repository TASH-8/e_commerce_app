import 'package:e_commerce_app/core/app_images/app_images.dart';
import 'package:e_commerce_app/features/product/presentation/widgets/side_custom_padding.dart';
import 'package:e_commerce_app/features/profile/presentation/widgets/user_name_edit_email.dart';
import 'package:flutter/material.dart';

class ProfileAndUserInfo extends StatelessWidget {
  const ProfileAndUserInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SidesCustomPadding(
      child: Container(
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              height: screenHeight * 0.15, // 15% of screen height
              width: screenWidth * 0.3, // 30% of screen width
              Assets.assetsBlankprofilepicturecircld,
            ),
            SizedBox(
              width: screenWidth * 0.04, // 4% of screen width
            ),
            const UserNameEditEmail(),
          ],
        ),
      ),
    );
  }
}
