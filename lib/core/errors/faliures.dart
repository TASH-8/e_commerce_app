import 'package:e_commerce_app/core/utils/app_enums.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class OfflineFailure extends Failure {
  const OfflineFailure(super.message);
}


class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class EmptyCacheFailure extends Failure {
  const EmptyCacheFailure(super.message);
}


class FirebaseAuthFailure extends Failure {
  final FirebaseAuthErrorType type;

  const FirebaseAuthFailure(this.type) : super('');
}

