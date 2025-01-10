import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/features/product/presentation/widgets/review_card.dart';
import 'package:flutter/material.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.05,
          horizontal: screenWidth * 0.05,
        ),
        child: const Column(
          children: [
            ReviewCard(
              initials: Constants.jdInitials,
              profileBackgroundColor: ColorManger.profileBackground1,
              reviewDate: Constants.jdReviewDate,
              reviewerName: Constants.jdName,
              reviewText: Constants.jdReviewText,
              rating: 4,
            ),
            SizedBox(height: 20),
            ReviewCard(
              initials: Constants.ssInitials,
              profileBackgroundColor: ColorManger.profileBackground2,
              reviewDate: Constants.ssReviewDate,
              reviewerName: Constants.ssName,
              reviewText: Constants.ssReviewText,
              rating: 3,
            ),
          ],
        ),
      ),
    );
  }
}
