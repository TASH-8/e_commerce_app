import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/faliures.dart';
import 'package:e_commerce_app/core/network/network_info.dart';
import 'package:e_commerce_app/core/strings/failures.dart';
import 'package:e_commerce_app/features/home/data/datasources/items_remotedatasource.dart';
import 'package:e_commerce_app/features/home/domain/enitites/items_entity.dart';
import 'package:e_commerce_app/features/home/domain/repo/items_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ItemsRepo)
class ItemsRepoimp implements ItemsRepo {
  final ItemsRemotedatasource remotedatasource;
  final NetworkInfo networkInfo;
  ItemsRepoimp({
    required this.remotedatasource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, List<ItemsEntity>>> getAllItems() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteItems = await remotedatasource.getAllItems();

        return Right(remoteItems);
      } on FirebaseException {
        return const Left(
          ServerFailure(SERVER_FAILURE_MESSAGE),
        );
      }
    } else {
      return const Left(
        OfflineFailure(OFFLINE_FAILURE_MESSAGE),
      );
    }
  }
}
