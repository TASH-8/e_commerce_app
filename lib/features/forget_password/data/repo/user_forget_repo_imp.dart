import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/error_handler.dart';
import 'package:e_commerce_app/core/errors/faliures.dart';
import 'package:e_commerce_app/core/network/network_info.dart';
import 'package:e_commerce_app/core/utils/app_enums.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/features/forget_password/data/datasources/user_forget_datasource.dart';
import 'package:e_commerce_app/features/forget_password/data/models/user_forget_model.dart';
import 'package:e_commerce_app/features/forget_password/domain/repo/forget_user_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserForgetRepo)
class UserForgetRepoImp implements UserForgetRepo {
  final UserForgetRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  UserForgetRepoImp(this.remoteDataSource, this.networkInfo);
  @override
  Future<Either<Failure, Unit>> getUserData(UserForgetModel user) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.getUserData(user);
        return const Right(unit);
      } on FirebaseAuthException catch (e) {
        return Left(FirebaseAuthFailure(mapFirebaseErrorCode(e.code)));
      } catch (e) {
        return const Left(
          FirebaseAuthFailure(FirebaseAuthErrorType.unexpected),
        );
      }
    } else {
      return const Left(OfflineFailure(Constants.ERROR_NO_INTERNET));
    }
  }
}
