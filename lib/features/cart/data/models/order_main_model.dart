import 'package:e_commerce_app/features/cart/data/models/items_model.dart';
import 'package:e_commerce_app/features/cart/domain/entities/order_main_enitity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'order_main_model.g.dart';

@JsonSerializable()
class OrderMainModel extends OrderMainEntity {
  const OrderMainModel({required super.orderList, required super.orderTotalPrice, required super.userId});

  factory OrderMainModel.fromJson(Map<String, dynamic> json) =>
      _$OrderMainModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderMainModelToJson(this);
}
