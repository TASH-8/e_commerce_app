// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_forget_bloc.dart';

enum UserForgetStatus { initial, loading, success, error }

class UserForgetState extends Equatable {
  final UserForgetStatus status;
  final String messege;

  const UserForgetState(
      {this.status = UserForgetStatus.initial, this.messege = ''});

  @override
  List<Object?> get props => [status, messege];

  UserForgetState copyWith({
    UserForgetStatus? status,
    String? messege,
  }) {
    return UserForgetState(
      status: status ?? this.status,
      messege: messege ?? this.messege,
    );
  }
}
