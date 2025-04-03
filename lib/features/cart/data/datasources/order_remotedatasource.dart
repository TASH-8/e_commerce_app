// ignore_for_file: use_rethrow_when_possible

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/cart/data/models/order_main_model.dart';
import 'package:injectable/injectable.dart';

abstract class OrderRemotedatasource {
  Future<Unit> placeOrder(OrderMainModel order);
}

@LazySingleton(as: OrderRemotedatasource)
class OrderRemotedatasourceImp implements OrderRemotedatasource {
  final FirebaseFirestore fireStore;
  CollectionReference orders = FirebaseFirestore.instance.collection('orders');

  OrderRemotedatasourceImp({
    required this.fireStore,
  });
  @override
  Future<Unit> placeOrder(OrderMainModel orderModel) async {
    try {
      await orders.add({
        "orderList": orderModel.orderList.map((item) => item.toJson()).toList(),
      });
      return unit;
    } on FirebaseException catch (e) {
      throw e;
    }
  }
}
