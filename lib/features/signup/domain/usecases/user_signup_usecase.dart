import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/faliures.dart';
import 'package:e_commerce_app/features/signup/data/models/user_signup_model.dart';
import 'package:e_commerce_app/features/signup/domain/repositories/user_signup_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUserSignupDataUsecase {
  final UserSignUpRepository repository;

  GetUserSignupDataUsecase(this.repository);

  Future<Either<Failure, Unit>> call(UserSignupModel user) async {
    return await repository.getUserData(user);
  }
}
