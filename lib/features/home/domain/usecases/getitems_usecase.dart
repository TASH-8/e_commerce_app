import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/faliures.dart';
import 'package:e_commerce_app/features/home/domain/enitites/items_entity.dart';
import 'package:e_commerce_app/features/home/domain/repo/items_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetitemsUsecase {
  final ItemsRepo repo;

  GetitemsUsecase(this.repo);

  Future<Either<Failure, List<ItemsEntity>>> call() async {
    return await repo.getAllItems();
  }
}
