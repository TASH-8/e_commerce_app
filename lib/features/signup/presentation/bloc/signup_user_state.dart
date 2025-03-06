// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'signup_user_bloc.dart';

enum UserStatus { loading, loaded, error, initial }

class SignupUserState extends Equatable {
  final UserStatus status;
  final String message;

  const SignupUserState({
    this.status = UserStatus.initial,
    this.message = '',
  });

  @override
  List<Object?> get props => [status, message];

  SignupUserState copyWith({
    UserStatus? status,
    String? message,
  }) {
    return SignupUserState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
