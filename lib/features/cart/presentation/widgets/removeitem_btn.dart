import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/features/cart/presentation/blocs/bloc/cart_bloc.dart';
import 'package:e_commerce_app/features/cart/presentation/blocs/bloc/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoveItemBtn extends StatelessWidget {
  const RemoveItemBtn({
    super.key,
    required this.item,
  });

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      style: IconButton.styleFrom(
        backgroundColor: ColorManger.greyCustom, // Background color
        padding: const EdgeInsets.all(
          1,
        ), // Reduce padding to make the button smaller
        minimumSize: const Size(
          20,
          20,
        ), // Set a smaller minimum size for the button
      ),
      onPressed: () {
        context.read<CartBloc>().add(DecreameantEvent(item.itemName));
      },
      icon: const Icon(Icons.remove, size: 20), // Reduce the icon size
    );
  }
}
