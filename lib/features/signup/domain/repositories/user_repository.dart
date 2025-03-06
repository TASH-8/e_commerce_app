import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/faliures.dart';
import 'package:e_commerce_app/features/signup/data/models/user_model.dart';

abstract class UserRepository {
  Future<Either<Failure, Unit>> getUserData(UserModel user);
}
