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

  @override
  List<Object> get props => [itemName, itemPicture, itemPrice];
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
  final List<ItemsModel> orderList;

  const CheckoutEvent({
    required this.orderList,
  });
  @override
  List<Object> get props => [orderList];
}
