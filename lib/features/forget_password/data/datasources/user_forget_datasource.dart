import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/forget_password/data/models/user_forget_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

abstract class UserForgetRemoteDataSource {
  Future<Unit> getUserData(UserForgetModel user);
}

@LazySingleton(as: UserForgetRemoteDataSource)
class UserForgetRemoteDataSourceImp implements UserForgetRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  UserForgetRemoteDataSourceImp({required this.firebaseAuth});

  @override
  Future<Unit> getUserData(UserForgetModel user) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: user.email);
      return unit;
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }
}
