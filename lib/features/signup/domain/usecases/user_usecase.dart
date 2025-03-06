import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/faliures.dart';
import 'package:e_commerce_app/features/signup/data/models/user_model.dart';
import 'package:e_commerce_app/features/signup/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUserDataUsecase {
  final UserRepository repository;

  GetUserDataUsecase(this.repository);

  Future<Either<Failure, Unit>> call(UserModel user) async {
    return await repository.getUserData(user);
  }
}
