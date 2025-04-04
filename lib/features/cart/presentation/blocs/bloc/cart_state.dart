// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:e_commerce_app/features/cart/data/models/items_model.dart';

enum CartStatus {
  orderError,
  orderSuccess,
  initial,
  loaded,
  increment,
  decrement,
  remove,
  orderLoading,
}

class CartState extends Equatable {
  final CartStatus status;
  final List<CartItem> items;
  final String messege;
  final List<ItemsModel> orderList;
  final num orderTotalPrice;

  const CartState({
    this.orderTotalPrice = 0,
    this.orderList = const [],
    this.messege = '',
    required this.status,
    this.items = const [],
  });

  @override
  List<Object?> get props => [status, items, orderList];

  CartState copyWith({
    CartStatus? status,
    List<CartItem>? items,
    String? messege,
    List<ItemsModel>? orderList,
    num? orderTotalPrice,
  }) {
    return CartState(
        status: status ?? this.status,
        items: items ?? this.items,
        messege: messege ?? this.messege,
        orderList: orderList ?? this.orderList,
        orderTotalPrice: orderTotalPrice ?? this.orderTotalPrice);
  }

  double get totalPrice =>
      items.fold(0, (total, item) => total + (item.itemPrice * item.quantity));
}

class CartItem {
  final String itemName;
  final String itemPicture;
  final num itemPrice;
  final int quantity;

  CartItem({
    required this.itemName,
    required this.itemPicture,
    required this.itemPrice,
    this.quantity = 1,
  });

  CartItem copyWith({int? quantity}) {
    return CartItem(
      itemName: itemName,
      itemPicture: itemPicture,
      itemPrice: itemPrice,
      quantity: quantity ?? this.quantity,
    );
  }
}
