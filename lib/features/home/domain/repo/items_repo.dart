import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/faliures.dart';
import 'package:e_commerce_app/features/home/domain/enitites/items_entity.dart';

abstract class ItemsRepo {
  Future<Either<Failure, List<ItemsEntity>>> getAllItems();
}
