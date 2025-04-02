import 'package:equatable/equatable.dart';

class OrderEnitity extends Equatable {
  final String itemName;
  final String itemPicture;
  final num itemPrice;
  final num quantity;
  final num itemTotal;

  const OrderEnitity(
      {required this.itemName,
      required this.itemPicture,
      required this.itemPrice,
      required this.itemTotal,
      required this.quantity});

  @override
  List<Object?> get props =>
      [quantity, itemTotal, itemName, itemPicture, itemPrice];
}
