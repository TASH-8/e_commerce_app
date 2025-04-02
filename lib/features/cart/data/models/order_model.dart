import 'package:e_commerce_app/features/cart/domain/entities/order_enitity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'order_model.g.dart';

@JsonSerializable()
class OrderModel extends OrderEnitity {
  const OrderModel(
      {required super.itemName,
      required super.itemPicture,
      required super.itemPrice,
      required super.itemTotal,
      required super.quantity});

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
