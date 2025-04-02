import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/exeptions.dart';
import 'package:e_commerce_app/core/errors/faliures.dart';
import 'package:e_commerce_app/core/network/network_info.dart';
import 'package:e_commerce_app/core/strings/failures.dart';
import 'package:e_commerce_app/features/cart/data/datasources/order_remotedatasource.dart';
import 'package:e_commerce_app/features/cart/data/models/order_model.dart';
import 'package:e_commerce_app/features/cart/domain/repo/order_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: OrderRepo)
class OrderRepoImp implements OrderRepo {
  final OrderRemotedatasource remotedatasource;
  final NetworkInfo networkInfo;
  OrderRepoImp(this.remotedatasource, this.networkInfo);

  @override
  Future<Either<Failure, Unit>> placeOrder(OrderModel order) async {
    if (await networkInfo.isConnected) {
      try {
        await remotedatasource.placeOrder(order);
        return const Right(unit);
      } on ServerException {
        return const Left(ServerFailure(SERVER_FAILURE_MESSAGE));
      }
    } else {
      return const Left(OfflineFailure(OFFLINE_FAILURE_MESSAGE));
    }
  }
}
