import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/theming/text_styles.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/features/product/presentation/widgets/side_custom_padding.dart';
import 'package:flutter/material.dart';

class RecommendedAndRefreshBtn extends StatelessWidget {
  const RecommendedAndRefreshBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SidesCustomPadding(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Flexible(
            child: AutoSizeText(
              Constants.Recommended,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.font15GreyNormal,
            ),
          ),
          Flexible(
            child: TextButton(
              onPressed: () {},
              child: const AutoSizeText(
                Constants.Refresh,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.font16RedAccentNormal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
