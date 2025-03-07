part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class GetUserLoginDataEvent extends LoginEvent {
  final String email;
  final String password;

  const GetUserLoginDataEvent({required this.email, required this.password});
  @override
  List<Object> get props => [email, password];
}

class ForgetPasswordEvent extends LoginEvent {
  final String email;
  const ForgetPasswordEvent({required this.email});
  @override
  List<Object> get props => [email];
}
