// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemsModel _$OrderItemModelFromJson(Map<String, dynamic> json) =>
    ItemsModel(
      itemPrice: json['itemPrice'] as num,
      itemTotal: json['itemTotal'] as num,
      quantity: json['quantity'] as num,
      itemPicture: json['itemPicture'] as String,
      itemName: json['itemName'] as String,
    );

Map<String, dynamic> _$OrderItemModelToJson(ItemsModel instance) =>
    <String, dynamic>{
      'itemPrice': instance.itemPrice,
      'itemTotal': instance.itemTotal,
      'quantity': instance.quantity,
      'itemPicture': instance.itemPicture,
      'itemName': instance.itemName,
    };
