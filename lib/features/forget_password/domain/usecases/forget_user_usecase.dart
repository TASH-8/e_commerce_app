import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/faliures.dart';
import 'package:e_commerce_app/features/forget_password/data/models/user_forget_model.dart';
import 'package:e_commerce_app/features/forget_password/domain/repo/forget_user_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUserLoginDataUsecase {
  final UserForgetRepo repository;

  GetUserLoginDataUsecase(this.repository);

  Future<Either<Failure, Unit>> call(UserForgetModel user) async {
    return await repository.getUserData(user);
  }
}
