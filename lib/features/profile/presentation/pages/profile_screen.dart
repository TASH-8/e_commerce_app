import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/core/widgets/custom_list_tile_actions.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/appbar_builder.dart';
import 'package:e_commerce_app/features/profile/presentation/widgets/order_profile_items.dart';
import 'package:e_commerce_app/features/profile/presentation/widgets/profile_user_info.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: buildHomeScreenAppBar(
          backgroundColor: Colors.grey.shade100,
          context: context,
        ),
      ),
      backgroundColor: ColorManger.greyshade100, // Your background color

      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileAndUserInfo(), // User info section
            SizedBox(height: screenHeight * 0.05), // Spacing
            CustomListTilesActions(
              items: orderItems,
            ), // Order actions section,)
            const SizedBox(
              height: 20,
            ),
            CustomListTilesActions(
              items: profileActions,
            ),
          ],
        ),
      ),
    );
  }
}
