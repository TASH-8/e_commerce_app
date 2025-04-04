import 'package:e_commerce_app/features/cart/data/models/items_model.dart';
import 'package:equatable/equatable.dart';

class OrderMainEntity extends Equatable {
  final List<ItemsModel> orderList;
  final num orderTotalPrice;
  final String userId;

  const OrderMainEntity({
    required this.userId,
    required this.orderList,
    required this.orderTotalPrice,
  });

  @override
  List<Object?> get props => [orderList, orderTotalPrice];
}
