part of 'signup_user_bloc.dart';

sealed class SignupUserEvent extends Equatable {
  const SignupUserEvent();

  @override
  List<Object> get props => [];
}

class GetUserDataEvent extends SignupUserEvent {
  final String email;
  final String password;

  const GetUserDataEvent({required this.email, required this.password});
}

class WhenPressedEvent extends SignupUserEvent {}
