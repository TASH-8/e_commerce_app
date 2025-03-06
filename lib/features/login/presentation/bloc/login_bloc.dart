import 'package:e_commerce_app/core/utils/app_enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/core/errors/faliures.dart';
import 'package:e_commerce_app/features/login/data/models/user_login_models.dart';
import 'package:e_commerce_app/features/login/domain/usecases/user_login_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final GetUserLoginDataUsecase getAllData;

  LoginBloc({required this.getAllData}) : super(const LoginState()) {
    on<LoginEvent>(
      (event, emit) async {
        if (event is GetUserLoginDataEvent) {
          emit(state.copyWith(status: LoginStateStatus.loading));

          final userModel = UserLoginModels(
            email: event.email,
            password: event.password,
          );

          final failureOrUnit = await getAllData(userModel);
          failureOrUnit.fold(
            (failure) => emit(
              state.copyWith(
                status: LoginStateStatus.error,
                message: _mapFailureToMessage(failure),
              ),
            ),
            (_) => emit(
              state.copyWith(
                status: LoginStateStatus.success,
              ),
            ),
          );
        }
      },
    );
  }
}

String _mapFailureToMessage(Failure failure) {
  if (failure is FirebaseAuthFailure) {
    switch (failure.type) {
      case FirebaseAuthErrorType.emailAlreadyInUse:
        return 'Email is already in use.';
      case FirebaseAuthErrorType.invalidEmail:
        return 'Invalid email address.';
      case FirebaseAuthErrorType.operationNotAllowed:
        return 'Operation not allowed.';
      case FirebaseAuthErrorType.weakPassword:
        return 'Password is too weak.';
      case FirebaseAuthErrorType.userNotFound:
        return 'No account found with this email.';
      case FirebaseAuthErrorType.wrongPassword:
        return 'Incorrect password.';
      case FirebaseAuthErrorType.userDisabled:
        return 'User account is disabled.';
      case FirebaseAuthErrorType.tooManyRequests:
        return 'Too many requests. Try again later.';
      case FirebaseAuthErrorType.networkRequestFailed:
        return 'Network error. Check your connection.';
      case FirebaseAuthErrorType.unexpected:
        return 'An unexpected error occurred. Try again.';
      case FirebaseAuthErrorType.invalidCredential:
        return 'Invalid credentials. Please check your email and password.';
    }
  } else if (failure is ServerFailure) {
    return 'Server error.';
  } else if (failure is OfflineFailure) {
    return 'No internet connection.';
  } else {
    return 'Unexpected error.';
  }
}
