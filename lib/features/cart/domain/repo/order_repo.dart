import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/faliures.dart';
import 'package:e_commerce_app/features/cart/data/models/order_model.dart';

abstract class OrderRepo {
  Future<Either<Failure, Unit>> placeOrder(OrderModel order);
}
