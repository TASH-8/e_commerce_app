import 'package:e_commerce_app/core/errors/error_handler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          message: mapFailureToMessage(failure),
        )),
        (_) => emit(state.copyWith(
          status: UserStatus.loaded,
        )),
      );
    });
  }
}

