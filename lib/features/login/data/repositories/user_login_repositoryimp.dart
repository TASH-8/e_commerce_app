import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/error_handler.dart';
import 'package:e_commerce_app/core/errors/faliures.dart';
import 'package:e_commerce_app/core/network/network_info.dart';
import 'package:e_commerce_app/core/utils/app_enums.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/features/login/data/datasources/user_login_datasources.dart';
import 'package:e_commerce_app/features/login/data/models/user_login_models.dart';
import 'package:e_commerce_app/features/login/domain/repositories/user_login_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserLoginRepository)
class UserLoginRepositoryImp implements UserLoginRepository {
  final UserLoginRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  UserLoginRepositoryImp(this.remoteDataSource, this.networkInfo);
  @override
  Future<Either<Failure, Unit>> getUserData(UserLoginModels user) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.getUserData(user);
        return const Right(unit);
      } on FirebaseAuthException catch (e) {
        return Left(FirebaseAuthFailure(mapFirebaseErrorCode(e.code)));
      } catch (e) {
        return const Left(
            FirebaseAuthFailure(FirebaseAuthErrorType.unexpected));
      }
    } else {
      return const Left(OfflineFailure(Constants.ERROR_NO_INTERNET));
    }
  }
}

