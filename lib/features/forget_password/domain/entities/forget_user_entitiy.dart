import 'package:equatable/equatable.dart';

class ForgetUserEntity extends Equatable {
  final String email;
  const ForgetUserEntity({required this.email});

  @override
  List<Object?> get props => [email];
}
