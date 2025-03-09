import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/faliures.dart';

abstract class LogoutRepo {
  Future<Either<Failure, Unit>> logout();
}
