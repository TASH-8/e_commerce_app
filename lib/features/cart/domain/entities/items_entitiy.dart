import 'package:equatable/equatable.dart';

class ItemsEntity extends Equatable {
  final num itemPrice;
  final num itemTotal;
  final num quantity;
  final String itemPicture;
  final String itemName;

  const ItemsEntity({
    required this.itemPrice,
    required this.itemTotal,
    required this.quantity,
    required this.itemPicture,
    required this.itemName,
  });

  @override
  List<Object?> get props =>
      [itemPrice, itemTotal, quantity, itemPicture, itemName];
}
