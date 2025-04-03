import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/faliures.dart';
import 'package:e_commerce_app/features/cart/data/models/order_main_model.dart';
import 'package:e_commerce_app/features/cart/domain/repo/order_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PlaceOrderUsecase {
  final OrderRepo repo;

  PlaceOrderUsecase(this.repo);

  Future<Either<Failure, Unit>> call(OrderMainModel order) async {
    return await repo.placeOrder(order);
  }
}
