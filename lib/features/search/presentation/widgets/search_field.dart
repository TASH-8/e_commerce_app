import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/features/product/presentation/widgets/side_custom_padding.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return SidesCustomPadding(
      child: SearchBar(
        controller: controller,
        leading: Icon(
          Icons.search,
          color: ColorManger.greyCustomShade,
        ),
        hintText: Constants.SearchSomthing,
        backgroundColor: const WidgetStatePropertyAll(Color(0xfff1f2f3)),
        hintStyle: WidgetStatePropertyAll(
          TextStyle(
            color: ColorManger.greyCustomShade,
          ),
        ),
      ),
    );
  }
}
