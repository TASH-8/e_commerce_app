// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      itemName: json['itemName'] as String,
      itemPicture: json['itemPicture'] as String,
      itemPrice: json['itemPrice'] as num,
      itemTotal: json['itemTotal'] as num,
      quantity: json['quantity'] as num,
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'itemName': instance.itemName,
      'itemPicture': instance.itemPicture,
      'itemPrice': instance.itemPrice,
      'quantity': instance.quantity,
      'itemTotal': instance.itemTotal,
    };
