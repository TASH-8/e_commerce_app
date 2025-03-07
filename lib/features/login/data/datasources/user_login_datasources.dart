import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/login/data/models/user_login_models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

// Abstract Remote Data Source
abstract class UserLoginRemoteDataSource {
  Future<Unit> getUserData(UserLoginModels user);
}

@LazySingleton(as: UserLoginRemoteDataSource)
class UserSignupRemoteDataSourceImp implements UserLoginRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  UserSignupRemoteDataSourceImp({required this.firebaseAuth});

@override
Future<Unit> getUserData(UserLoginModels user) async {
  try {
    await firebaseAuth.signInWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );
    return unit;
  } on FirebaseAuthException catch (e) {
    throw e; 
  }
}


}
