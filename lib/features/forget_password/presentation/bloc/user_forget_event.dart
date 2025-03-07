part of 'user_forget_bloc.dart';

sealed class UserForgetEvent extends Equatable {
  const UserForgetEvent();

  @override
  List<Object> get props => [];
}

class GetUserForgetEvent extends UserForgetEvent {
  final String email;

  const GetUserForgetEvent({required this.email});
  @override
  List<Object> get props => [email];
}
