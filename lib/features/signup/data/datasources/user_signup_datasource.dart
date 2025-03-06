import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/signup/data/models/user_signup_model.dart';
import 'package:e_commerce_app/features/signup/domain/entities/user_signup_entitiy.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

// Abstract Remote Data Source
abstract class UserSignupRemoteDataSource {
  Future<Unit> getUserData(UserSignupModel user);
}

@LazySingleton(as: UserSignupRemoteDataSource)
class UserSignupRemoteDataSourceImp implements UserSignupRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  UserSignupRemoteDataSourceImp({required this.firebaseAuth});

  @override
  Future<Unit> getUserData(UserSignupEntity user) async {
    try {
      // ignore: unused_local_variable
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      return unit;
    } on FirebaseAuthException catch (e) {
      // ignore: use_rethrow_when_possible
      throw e;
    }
  }
}
