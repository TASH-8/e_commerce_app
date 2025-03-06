 import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/faliures.dart';
import 'package:e_commerce_app/features/login/data/models/user_login_models.dart';

abstract class UserLoginRepository {
  Future<Either<Failure, Unit>> getUserData(UserLoginModels user);

 }