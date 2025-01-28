import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/core/theming/text_styles.dart';
import 'package:e_commerce_app/features/cart/presentation/blocs/bloc/cart_bloc.dart';
import 'package:e_commerce_app/features/cart/presentation/blocs/bloc/cart_state.dart';
import 'package:e_commerce_app/features/cart/presentation/widgets/addItem_btn.dart';
import 'package:e_commerce_app/features/cart/presentation/widgets/removeitem_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItems extends StatelessWidget {
  const CartItems({
    super.key,
    required this.item,
    required this.index,
    required this.state,
  });

  final CartItem item;
  final int index;
  final CartState state;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: screenWidth * 0.08,
            top: screenHeight * 0.04,
          ),
          child: Row(
            children: [
              Container(
                width: screenWidth * 0.3,
                height: screenWidth * 0.3,
                decoration: const BoxDecoration(
                  color: ColorManger.white,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(item.itemPicture),
              ),
              SizedBox(width: screenWidth * 0.05),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        item.itemName,
                        style: TextStyles.font16GreyNormal,
                      ),
                      SizedBox(width: screenWidth * 0.08),
                      IconButton(
                        onPressed: () {
                          context.read<CartBloc>().add(
                                RemoveEvent(itemName: item.itemName),
                              );
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    '\$${item.itemPrice}',
                    style: TextStyles.font16RedAccentNormal,
                  ),
                  Row(
                    children: [
                      RemoveItemBtn(item: item),
                      SizedBox(
                        width: screenWidth * 0.05,
                      ),
                      Text(
                        '${item.quantity}',
                      ),
                      SizedBox(
                        width: screenWidth * 0.05,
                      ),
                      AddItemBtn(item: item),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        if (index < state.items.length - 1)
          Divider(
            color: Colors.grey.shade300,
            thickness: 1,
            indent: screenWidth * 0.08,
            endIndent: screenWidth * 0.08,
          ),
      ],
    );
  }
}
