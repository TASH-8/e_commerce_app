import 'package:e_commerce_app/features/cart/data/models/items_model.dart';
import 'package:e_commerce_app/features/cart/domain/entities/order_main_enitity.dart';
part 'order_main_model.g.dart';

class OrderMainModel extends OrderMainEntity {
  OrderMainModel({required super.orderList});

  factory OrderMainModel.fromJson(Map<String, dynamic> json) =>
      _$OrderMainModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderMainModelToJson(this);
}
