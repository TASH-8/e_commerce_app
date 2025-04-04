import 'package:e_commerce_app/features/cart/domain/entities/items_entitiy.dart';
import 'package:json_annotation/json_annotation.dart';

part 'items_model.g.dart';

@JsonSerializable()
class ItemsModel extends ItemsEntity {
  ItemsModel(
      {required super.itemPrice,
      required super.itemTotal,
      required super.quantity,
      required super.itemPicture,
      required super.itemName});

  factory ItemsModel.fromJson(Map<String, dynamic> json) =>
      _$ItemsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsModelToJson(this);
}
