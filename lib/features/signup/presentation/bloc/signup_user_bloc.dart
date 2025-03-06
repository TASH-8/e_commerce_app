import 'package:e_commerce_app/core/utils/app_enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/core/errors/faliures.dart';
import 'package:e_commerce_app/features/signup/data/models/user_signup_model.dart';
import 'package:e_commerce_app/features/signup/domain/usecases/user_signup_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'signup_user_event.dart';
part 'signup_user_state.dart';

@injectable
class SignupUserBloc extends Bloc<SignupUserEvent, SignupUserState> {
  final GetUserSignupDataUsecase getAllData;
  SignupUserBloc({required this.getAllData}) : super(const SignupUserState()) {
    on<GetUserDataEvent>((event, emit) async {
      emit(state.copyWith(status: UserStatus.loading));

      final userModel = UserSignupModel(
        uid: '', // UID is empty at signup
        email: event.email,
        password: event.password,
      );

      final failureOrUnit = await getAllData(userModel);
      failureOrUnit.fold(
        (failure) => emit(state.copyWith(
          status: UserStatus.error,
          message: _mapFailureToMessage(failure),
        )),
        (_) => emit(state.copyWith(
          status: UserStatus.loaded,
        )),
      );
    });
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
        return 'Please check your email and password and try again';
    }
  } else if (failure is ServerFailure) {
    return 'Server error.';
  } else if (failure is OfflineFailure) {
    return 'No internet connection.';
  } else {
    return 'Unexpected error.';
  }
}
