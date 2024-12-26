import 'package:e_commerce_app/features/home/presentation/widgets/btn_test.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05, vertical: screenHeight * 0.012),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_active_outlined),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.message_outlined),
                )
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Catogories",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ), 
            SizedBox(height: screenHeight * 0.02,),
            const Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [CustomCategoryButton(),CustomCategoryButton(),CustomCategoryButton(),],)
          ],
        ),
      ),
    );
  }
}
