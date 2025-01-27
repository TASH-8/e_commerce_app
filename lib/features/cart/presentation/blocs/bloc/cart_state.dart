// // ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

enum CartStatus { initial, counterinitial, loaded, error, increment, decrement }

class CartState extends Equatable {
  final CartStatus status;
  final String? itemName;
  final String? itemPicture;
  final double? itemPrice;
  final int? quantity;

  const CartState(
      {required this.status,
      this.itemName,
      this.itemPicture,
      this.itemPrice,
      this.quantity = 1});

  @override
  List<Object?> get props =>
      [status, itemName, itemPicture, itemPrice, quantity];

  CartState copyWith({
    CartStatus? status,
    String? itemName,
    String? itemPicture,
    double? itemPrice,
    int? quantity,
  }) {
    return CartState(
      status: status ?? this.status,
      itemName: itemName ?? this.itemName,
      itemPicture: itemPicture ?? this.itemPicture,
      itemPrice: itemPrice ?? this.itemPrice,
      quantity: quantity ?? this.quantity,
    );
  }
}


