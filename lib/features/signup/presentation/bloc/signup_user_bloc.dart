import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/core/errors/faliures.dart';
import 'package:e_commerce_app/core/strings/failures.dart';
import 'package:e_commerce_app/features/signup/data/models/user_model.dart';
import 'package:e_commerce_app/features/signup/domain/usecases/user_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'signup_user_event.dart';
part 'signup_user_state.dart';

@injectable
class SignupUserBloc extends Bloc<SignupUserEvent, SignupUserState> {
  final GetUserDataUsecase getAllData;
  SignupUserBloc({required this.getAllData}) : super(const SignupUserState()) {
    on<GetUserDataEvent>((event, emit) async {
      emit(state.copyWith(status: UserStatus.loading));

      final userModel = UserModel(
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

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case const (ServerFailure):
        return SERVER_FAILURE_MESSAGE;
      case const (FirebaseAuthFailure):
        return (failure as FirebaseAuthFailure)
            .message; // Firebase-specific error
      case const (OfflineFailure):
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error, Please try again later.";
    }
  }
}

class FirebaseAuthFailure extends Failure {
  final String message;

  const FirebaseAuthFailure(this.message) : super('');

  @override
  List<Object?> get props => [message];
}
