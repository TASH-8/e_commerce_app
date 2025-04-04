// ignore_for_file: use_rethrow_when_possible

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/cart/data/models/order_main_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

abstract class OrderRemotedatasource {
  Future<Unit> placeOrder(OrderMainModel order);
}

@LazySingleton(as: OrderRemotedatasource)
class OrderRemotedatasourceImp implements OrderRemotedatasource {
  final FirebaseFirestore fireStore;
  CollectionReference orders = FirebaseFirestore.instance.collection('orders');
  final FirebaseAuth auth;
  OrderRemotedatasourceImp({
    required this.auth,
    required this.fireStore,
  });
  @override
  Future<Unit> placeOrder(OrderMainModel orderModel) async {
    try {
      await orders.add({
        "userId": auth.currentUser!.uid,
        "orderList": orderModel.orderList.map((item) => item.toJson()).toList(),
        "orderTotalPrice": orderModel.orderTotalPrice
      });
      return unit;
    } on FirebaseException catch (e) {
      throw e;
    }
  }
}
