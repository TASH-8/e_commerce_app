// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemsModel _$ItemsModelFromJson(Map<String, dynamic> json) => ItemsModel(
      itemName: json['itemName'] as String,
      itemPicture: json['itemPicture'] as String,
      itemPrice: json['itemPrice'] as num?,
    );

Map<String, dynamic> _$ItemsModelToJson(ItemsModel instance) =>
    <String, dynamic>{
      'itemName': instance.itemName,
      'itemPicture': instance.itemPicture,
      'itemPrice': instance.itemPrice,
    };
