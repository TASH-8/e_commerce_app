import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/features/profile/presentation/widgets/order_profile_actions.dart';
import 'package:e_commerce_app/features/profile/presentation/widgets/order_profile_items.dart';
import 'package:e_commerce_app/features/profile/presentation/widgets/profile_user_info.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorManger.greyshade100, // Your background color

      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileAndUserInfo(), // User info section
            SizedBox(height: screenHeight * 0.05), // Spacing
            OrderProfileActions(
              orderItems: orderItems,
            ), // Order actions section,)
            const SizedBox(
              height: 20,
            ),
            OrderProfileActions(
              orderItems: profileActions,
            ),
          ],
        ),
      ),
    );
  }
}
