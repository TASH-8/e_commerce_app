import 'package:e_commerce_app/features/home/domain/enitites/items_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'items_model.g.dart';

@JsonSerializable()
class ItemsModel extends ItemsEntity {
  const ItemsModel({
    required super.itemName,
    required super.itemPicture,
    required super.itemPrice,
  });

  factory ItemsModel.fromJson(Map<String, dynamic> json) =>
      _$ItemsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsModelToJson(this);
}
