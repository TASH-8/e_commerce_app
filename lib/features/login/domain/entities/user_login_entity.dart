import 'package:equatable/equatable.dart';

class UserLoginEntities extends Equatable {
  final String email;
  final String password;

  const UserLoginEntities({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
