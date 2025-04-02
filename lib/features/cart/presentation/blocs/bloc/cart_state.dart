import 'package:equatable/equatable.dart';

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

enum CartStatus {
  orderError,
  orderSuccess,
  initial,
  loading,
  loaded,
  error,
  increment,
  decrement,
  remove,
  orderLoading,
}

class CartState extends Equatable {
  final CartStatus status;
  final List<CartItem> items;
  final String messege;
  

  const CartState({
    this.messege = '',
    required this.status,
    this.items = const [],
  });

  double get totalPrice =>
      items.fold(0, (total, item) => total + (item.itemPrice * item.quantity));

  @override
  List<Object?> get props => [status, items];

  CartState copyWith({
    String? messege,
    CartStatus? status,
    List<CartItem>? items,
  }) {
    return CartState(
      messege: messege ?? this.messege,
      status: status ?? this.status,
      items: items ?? this.items,
    );
  }
}
