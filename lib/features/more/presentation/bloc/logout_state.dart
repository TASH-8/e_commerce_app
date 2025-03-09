// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'logout_bloc.dart';

enum LogoutStatus { initial, success, error, loading }

class LogoutState extends Equatable {
  final LogoutStatus status;
  final String messege;

  const LogoutState({this.status = LogoutStatus.initial, this.messege = ''});

  @override
  List<Object?> get props => [status, messege];

  LogoutState copyWith({
    LogoutStatus? status,
    String? messege,
  }) {
    return LogoutState(
      status: status ?? this.status,
      messege: messege ?? this.messege,
    );
  }
}
