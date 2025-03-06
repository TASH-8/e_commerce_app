import 'package:equatable/equatable.dart';

class UserSignupEntity extends Equatable {
  final String uid;
  final String email;
  final String password;

  const UserSignupEntity(
      {required this.uid, required this.email, required this.password});

  @override
  List<Object?> get props => [uid, email, password];
}
