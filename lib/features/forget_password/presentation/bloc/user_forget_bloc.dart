import 'package:e_commerce_app/core/errors/error_handler.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/features/forget_password/data/models/user_forget_model.dart';
import 'package:e_commerce_app/features/forget_password/domain/usecases/forget_user_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
part 'user_forget_event.dart';
part 'user_forget_state.dart';

@injectable
class UserForgetBloc extends Bloc<UserForgetEvent, UserForgetState> {
  final GetUserLoginDataUsecase getAllData;

  UserForgetBloc({required this.getAllData}) : super(const UserForgetState()) {
    on<GetUserForgetEvent>((event, emit) async {
      emit(state.copyWith(status: UserForgetStatus.loading));
      final userModel = UserForgetModel(email: event.email);

      final failureOrUnit = await getAllData(userModel);
      failureOrUnit.fold(
        (failure) => emit(
          state.copyWith(
            status: UserForgetStatus.error,
            messege: mapFailureToMessage(failure),
          ),
        ),
        (_) => emit(
          state.copyWith(
            status: UserForgetStatus.success,
            messege: Constants.PASSWORDSENT,
          ),
        ),
      );
    });
  }
}
