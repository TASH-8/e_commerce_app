import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/error_handler.dart';
import 'package:e_commerce_app/core/errors/exeptions.dart';
import 'package:e_commerce_app/core/errors/faliures.dart';
import 'package:e_commerce_app/core/network/network_info.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/features/signup/data/datasources/user_signup_datasource.dart';
import 'package:e_commerce_app/features/signup/data/models/user_signup_model.dart';
import 'package:e_commerce_app/features/signup/domain/repositories/user_signup_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserSignUpRepository)
class UserSignupRepositoryImp implements UserSignUpRepository {
  final UserSignupRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  UserSignupRepositoryImp(this.networkInfo, {required this.remoteDataSource});

  @override
  Future<Either<Failure, Unit>> getUserData(UserSignupModel user) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.getUserData(user);
        return const Right(unit);
      } on FirebaseAuthException catch (e) {
        // Catch FirebaseAuthException and convert it to FirebaseAuthFailure
        return Left(FirebaseAuthFailure(mapFirebaseErrorCode(e.code)));
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      } catch (e) {
        return const Left(ServerFailure(Constants.ERROR_UNEXPECTED));
      }
    } else {
      return const Left(OfflineFailure(Constants.ERROR_NO_INTERNET));
    }
  }
}

