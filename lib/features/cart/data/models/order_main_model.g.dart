// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_main_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderMainModel _$OrderMainModelFromJson(Map<String, dynamic> json) =>
    OrderMainModel(
      orderList: (json['orderList'] as List<dynamic>)
          .map((e) => ItemsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderMainModelToJson(OrderMainModel instance) =>
    <String, dynamic>{
      'orderList': instance.orderList,
    };
