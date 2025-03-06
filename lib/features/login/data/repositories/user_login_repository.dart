import 'package:dartz/dartz.dart';
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

FirebaseAuthErrorType mapFirebaseErrorCode(String code) {
  switch (code) {
    case 'email-already-in-use':
      return FirebaseAuthErrorType.emailAlreadyInUse;
    case 'invalid-email':
      return FirebaseAuthErrorType.invalidEmail;
    case 'operation-not-allowed':
      return FirebaseAuthErrorType.operationNotAllowed;
    case 'weak-password':
      return FirebaseAuthErrorType.weakPassword;
    case 'user-not-found':
      return FirebaseAuthErrorType.userNotFound;
    case 'wrong-password':
      return FirebaseAuthErrorType.wrongPassword;
    case 'user-disabled':
      return FirebaseAuthErrorType.userDisabled;
    case 'too-many-requests':
      return FirebaseAuthErrorType.tooManyRequests;
    case 'network-request-failed':
      return FirebaseAuthErrorType.networkRequestFailed;
    case 'invalid-credential':
      return FirebaseAuthErrorType.invalidCredential; // 🔥 Add this line
    default:
      return FirebaseAuthErrorType.unexpected;
  }
}
