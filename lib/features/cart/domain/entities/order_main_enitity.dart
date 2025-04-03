import 'package:e_commerce_app/features/cart/data/models/items_model.dart';

class OrderMainEntity {
  final List<ItemsModel> orderList;

  const OrderMainEntity({required this.orderList});
}
