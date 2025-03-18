import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/core/theming/text_styles.dart';

import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  final String initials;
  final Color profileBackgroundColor;
  final String reviewDate;
  final String reviewerName;
  final String reviewText;
  final int rating; // Rating out of 5

  const ReviewCard({
    super.key,
    required this.initials,
    required this.profileBackgroundColor,
    required this.reviewDate,
    required this.reviewerName,
    required this.reviewText,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            height: screenHeight * 0.17,
            width: screenWidth * 0.17,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: profileBackgroundColor,
            ),
            child: Center(
              child: AutoSizeText(
                initials,
                style: TextStyles.initialsTextStyle,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ...List.generate(
                    rating,
                    (index) => const Icon(Icons.star, color: ColorManger.amber),
                  ),
                  ...List.generate(
                    5 - rating,
                    (index) => const Icon(Icons.star, color: ColorManger.grey),
                  ),
                  SizedBox(width: screenWidth * 0.15),
                  Text(
                    reviewDate,
                    style: TextStyles.font15GreyBold,
                  ),
                ],
              ),
              Text(
                reviewerName,
                style: TextStyles.font17nHalfBlackBold,
              ),
              const SizedBox(height: 10),
              AutoSizeText(
                reviewText,
                style: TextStyles.font14GreyCustomShadeReguler,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
