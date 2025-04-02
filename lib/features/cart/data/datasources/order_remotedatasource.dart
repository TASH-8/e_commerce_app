// ignore_for_file: use_rethrow_when_possible

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/faliures.dart';
import 'package:e_commerce_app/features/cart/data/models/order_model.dart';
import 'package:injectable/injectable.dart';

abstract class OrderRemotedatasource {
  Future<Unit> placeOrder(OrderModel order);
}

@LazySingleton(as: OrderRemotedatasource)
class OrderRemotedatasourceImp implements OrderRemotedatasource {
  final FirebaseFirestore fireStore;
  CollectionReference orders = FirebaseFirestore.instance.collection('orders');
  OrderRemotedatasourceImp({required this.fireStore});

  @override
  Future<Unit> placeOrder(OrderModel order) async {
    try {
      await orders.add({
        'itemName': order.itemName,
        'itemPicture': order.itemPicture,
        'itemPrice': order.itemPrice,
        'quantity': order.quantity,
        'itemTotal': order.itemTotal
      });

      return unit;
    } on ServerFailure catch (e) {
      throw e;
    }
  }
}
