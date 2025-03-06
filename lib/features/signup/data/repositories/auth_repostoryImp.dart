import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/exeptions.dart';
import 'package:e_commerce_app/core/errors/faliures.dart';
import 'package:e_commerce_app/core/network/network_info.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/features/signup/data/datasources/user_datasource.dart';
import 'package:e_commerce_app/features/signup/data/models/user_model.dart';
import 'package:e_commerce_app/features/signup/domain/repositories/user_repository.dart';
import 'package:e_commerce_app/features/signup/presentation/bloc/signup_user_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImp implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  UserRepositoryImp(this.networkInfo, {required this.remoteDataSource});

  @override
  Future<Either<Failure, Unit>> getUserData(UserModel user) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.getUserData(user);
        return const Right(unit);
      } on FirebaseAuthException catch (e) {
        // Catch FirebaseAuthException and convert it to FirebaseAuthFailure
        return Left(FirebaseAuthFailure(_mapFirebaseErrorCodeToMessage(e.code)));
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      } catch (e) {
        return const Left(ServerFailure(Constants.ERROR_UNEXPECTED));
      }
    } else {
      return const Left(OfflineFailure(Constants.ERROR_NO_INTERNET));
    }
  }

  String _mapFirebaseErrorCodeToMessage(String code) {
    switch (code) {
      case 'email-already-in-use':
        return Constants.ERROR_EMAIL_IN_USE;
      case 'invalid-email':
        return Constants.ERROR_INVALID_EMAIL;
      case 'operation-not-allowed':
        return Constants.ERROR_OPERATION_NOT_ALLOWED;
      case 'weak-password':
        return Constants.ERROR_WEAK_PASSWORD;
      default:
        return Constants.ERROR_TRY_AGAIN;
    }
  }
}
