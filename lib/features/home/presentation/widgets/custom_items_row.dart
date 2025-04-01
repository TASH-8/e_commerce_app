import 'package:e_commerce_app/core/widgets/loading.dart';
import 'package:e_commerce_app/features/home/presentation/bloc/items_bloc.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/custom_items_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomItemsRow extends StatelessWidget {
  const CustomItemsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
// this get the items from the collection of the firebase named Items .
    return BlocBuilder<ItemsBloc, ItemsState>(
      builder: (context, state) {
        switch (state.status) {
          case ItemsStatus.initial:
            return const Text("No items now");
          case ItemsStatus.loading:
            return const LoadingWidget();
          case ItemsStatus.success:
            return SizedBox(
              height: screenHeight * 0.25,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: state.items.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      CustomItemsBtn(
                        itemPicture: state.items[index].itemPicture,
                        itemName: state.items[index].itemName,
                        itemPrice: state.items[index].itemPrice!,
                      ),
                      const SizedBox(width: 7),
                    ],
                  );
                },
              ),
            );
          case ItemsStatus.error:
            return Center(
                child: TextButton(
              onPressed: () {
                context.read<ItemsBloc>().add(GetAllItemsEvent());
              },
              child: Text(
                  "${state.messege} Items Not Loaded Would You Want To Try Again?"),
            ));
        }
      },
    );
  }
}
