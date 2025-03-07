import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/faliures.dart';
import 'package:e_commerce_app/features/forget_password/data/models/user_forget_model.dart';

abstract class UserForgetRepo {
  Future<Either<Failure, Unit>> getUserData(UserForgetModel user);
}
