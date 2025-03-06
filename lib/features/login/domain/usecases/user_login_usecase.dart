import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/faliures.dart';
import 'package:e_commerce_app/features/login/data/models/user_login_models.dart';
import 'package:e_commerce_app/features/login/domain/repositories/user_login_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUserLoginDataUsecase {
  final UserLoginRepository repository;

  GetUserLoginDataUsecase(this.repository);

  Future<Either<Failure, Unit>> call(UserLoginModels user) async {
    return await repository.getUserData(user);
  }
}
