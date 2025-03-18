import 'package:equatable/equatable.dart';

class ItemsEntity extends Equatable {
  final String itemName;
  final String itemPicture;
  final num? itemPrice;

  const ItemsEntity({
    required this.itemName,
    required this.itemPicture,
    required this.itemPrice,
  });

  @override
  List<Object?> get props => [itemName, itemPicture, itemPrice];
}
