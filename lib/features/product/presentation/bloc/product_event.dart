part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class GetProductDetailEvent extends ProductEvent {
  final String itemName;
  final String itemPicture;
  final num itemPrice;

  const GetProductDetailEvent(
      {required this.itemName,
      required this.itemPicture,
      required this.itemPrice});
  @override
  List<Object> get props => [
        itemName,
        itemPicture,
        itemPrice,
      ];
}
