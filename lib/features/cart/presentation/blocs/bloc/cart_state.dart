import 'package:equatable/equatable.dart';

class CartItem {
  final String itemName;
  final String itemPicture;
  final double itemPrice;
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

enum CartStatus {
  initial,
  counterinitial,
  loaded,
  error,
  increment,
  decrement,
  remove
}

class CartState extends Equatable {
  final CartStatus status;
  final List<CartItem> items;

  const CartState({
    required this.status,
    this.items = const [],
  });

  double get totalPrice =>
      items.fold(0, (total, item) => total + (item.itemPrice * item.quantity));

  @override
  List<Object?> get props => [status, items];

  CartState copyWith({
    CartStatus? status,
    List<CartItem>? items,
  }) {
    return CartState(
      status: status ?? this.status,
      items: items ?? this.items,
    );
  }
}
