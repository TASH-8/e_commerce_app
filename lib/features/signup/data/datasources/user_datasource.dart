import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/signup/data/models/user_model.dart';
import 'package:e_commerce_app/features/signup/domain/entities/user_entitiy.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

// Abstract Remote Data Source
abstract class UserRemoteDataSource {
  Future<Unit> getUserData(UserModel user);
}

@LazySingleton(as: UserRemoteDataSource)
class UserRemoteDataSourceImp implements UserRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  UserRemoteDataSourceImp({required this.firebaseAuth});

  @override
  Future<Unit> getUserData(UserEntity user) async {
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
