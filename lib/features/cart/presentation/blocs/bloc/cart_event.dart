part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class GetProductToCartEvent extends CartEvent {
  final String itemName;
  final String itemPicture;
  final double itemPrice;
  const GetProductToCartEvent({
    required this.itemName,
    required this.itemPicture,
    required this.itemPrice,
  });
}

class IncrementEvent extends CartEvent {}

class DecreameantEvent extends CartEvent {}


