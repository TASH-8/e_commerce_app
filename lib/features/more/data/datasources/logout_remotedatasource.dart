import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

abstract class LogoutRemoteDataSource {
  Future<Unit> getUserData();
}

@LazySingleton(as: LogoutRemoteDataSource)
class LogoutRemotedatasourceImp implements LogoutRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  LogoutRemotedatasourceImp({required this.firebaseAuth});

  @override
  Future<Unit> getUserData() async {
    try {
      await firebaseAuth.signOut();
      return unit;
    } on FirebaseAuthException catch (e) {
      // ignore: use_rethrow_when_possible
      throw e;
    }
  }
}
