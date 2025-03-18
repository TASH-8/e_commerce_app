import 'package:e_commerce_app/core/errors/faliures.dart';
import 'package:e_commerce_app/core/strings/failures.dart';
import 'package:e_commerce_app/features/home/domain/usecases/getitems_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/features/home/domain/enitites/items_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'items_event.dart';
part 'items_state.dart';

@injectable
class ItemsBloc extends Bloc<ItemsEvent, ItemsState> {
  final GetitemsUsecase getAllitems;
  ItemsBloc({required this.getAllitems}) : super(const ItemsState()) {
    on<GetAllItemsEvent>((event, emit) async {
      emit(state.copyWith(status: ItemsStatus.loading));
      final failureOrItems = await getAllitems();
      failureOrItems.fold(
        (failure) => emit(state.copyWith(
            status: ItemsStatus.error,
            messege: _map1FailureToMessage(failure))),
        (items) =>
            emit(state.copyWith(status: ItemsStatus.success, items: items)),
      );
    });
  }
}

String _map1FailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure _:
      return SERVER_FAILURE_MESSAGE;
    case EmptyCacheFailure _:
      return EMPTY_CACHE_FAILURE_MESSAGE;
    case OfflineFailure _:
      return OFFLINE_FAILURE_MESSAGE;
    default:
      return "Unexpected Error , please try again later .";
  }
}
