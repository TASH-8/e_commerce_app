import 'package:e_commerce_app/core/errors/error_handler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    on<GetUserLoginDataEvent>(
      (event, emit) async {
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
              message: mapFailureToMessage(failure),
            ),
          ),
          (_) => emit(
            state.copyWith(
              status: LoginStateStatus.success,
            ),
          ),
        );
      },
    );
  }
}
