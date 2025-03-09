import 'package:e_commerce_app/core/errors/error_handler.dart';
import 'package:e_commerce_app/features/more/domain/usecases/logout_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'logout_event.dart';
part 'logout_state.dart';

@injectable
class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final LogoutUsecase logoutUsecase;

  LogoutBloc({required this.logoutUsecase}) : super(const LogoutState()) {
    on<LogUserOutEvent>((event, emit) async {
      emit(state.copyWith(status: LogoutStatus.loading));

      final failureOrUnit = await logoutUsecase();

      failureOrUnit.fold(
        (failure) => emit(
          state.copyWith(
            status: LogoutStatus.error,
            messege: mapFailureToMessage(failure),
          ),
        ),
        (_) => emit(
          state.copyWith(
            status: LogoutStatus.success,
          ),
        ),
      );
    });
  }
}
