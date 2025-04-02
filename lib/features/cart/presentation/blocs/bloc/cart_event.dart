part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class GetProductToCartEvent extends CartEvent {
  final String itemName;
  final String itemPicture;
  final num itemPrice;
  const GetProductToCartEvent({
    required this.itemName,
    required this.itemPicture,
    required this.itemPrice,
  });
}

class IncrementEvent extends CartEvent {
  final String itemName;

  const IncrementEvent(this.itemName);

  @override
  List<Object> get props => [itemName];
}

class DecreameantEvent extends CartEvent {
  final String itemName;

  const DecreameantEvent(this.itemName);

  @override
  List<Object> get props => [itemName];
}

class RemoveEvent extends CartEvent {
  final String itemName;

  const RemoveEvent({required this.itemName});
  @override
  List<Object> get props => [itemName];
}

class CheckoutEvent extends CartEvent {
  final String itemName;
  final num itemPrice;
  final String itemPicture;
  final num itemTotal;
  final num quantity;

  const CheckoutEvent(
      {required this.itemName,
      required this.itemPrice,
      required this.itemPicture,
      required this.itemTotal,
      required this.quantity});
}
