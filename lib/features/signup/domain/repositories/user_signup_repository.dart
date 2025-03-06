import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/faliures.dart';
import 'package:e_commerce_app/features/signup/data/models/user_signup_model.dart';

abstract class UserSignUpRepository {
  Future<Either<Failure, Unit>> getUserData(UserSignupModel user);
}
