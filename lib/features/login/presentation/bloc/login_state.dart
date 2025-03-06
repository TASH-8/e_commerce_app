// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

enum LoginStateStatus {
  initial,
  loading,
  success,
  error,
}

class LoginState extends Equatable {
  final LoginStateStatus status;
  final String message; // Fixed typo (was messege)

  const LoginState({
    this.status = LoginStateStatus.initial,
    this.message = '',
  });

  @override
  List<Object?> get props => [status, message];

  LoginState copyWith({
    LoginStateStatus? status,
    String? message, // Fixed typo
  }) {
    return LoginState(
      status: status ?? this.status,
      message: message ?? this.message, // Fixed typo
    );
  }
}
