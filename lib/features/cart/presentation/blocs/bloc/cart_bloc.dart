import 'package:e_commerce_app/core/errors/error_handler.dart';
import 'package:e_commerce_app/features/cart/data/models/order_model.dart';
import 'package:e_commerce_app/features/cart/domain/usecases/order_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/features/cart/presentation/blocs/bloc/cart_state.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'cart_event.dart';

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  final PlaceOrderUsecase placeOrderUseCase;
  CartBloc({required this.placeOrderUseCase})
      : super(const CartState(status: CartStatus.initial)) {
    on<GetProductToCartEvent>((event, emit) {
      final updatedItems = List<CartItem>.from(state.items);
      final existingItemIndex = updatedItems.indexWhere(
        (item) => item.itemName == event.itemName,
      );

      if (existingItemIndex != -1) {
        final existingItem = updatedItems[existingItemIndex];
        updatedItems[existingItemIndex] = existingItem.copyWith(
          quantity: existingItem.quantity + 1,
        );
      } else {
        updatedItems.add(CartItem(
          itemName: event.itemName,
          itemPicture: event.itemPicture,
          itemPrice: event.itemPrice,
        ));
      }

      emit(state.copyWith(status: CartStatus.loaded, items: updatedItems));
    });

    on<IncrementEvent>((event, emit) {
      final updatedItems = state.items.map((item) {
        if (item.itemName == event.itemName) {
          return item.copyWith(quantity: item.quantity + 1);
        }
        return item;
      }).toList();
      emit(state.copyWith(items: updatedItems));
    });

    on<DecreameantEvent>((event, emit) {
      final updatedItems = state.items.map((item) {
        if (item.itemName == event.itemName && item.quantity > 1) {
          return item.copyWith(quantity: item.quantity - 1);
        }
        return item;
      }).toList();
      emit(state.copyWith(items: updatedItems));
    });
    on<RemoveEvent>((event, emit) {
      final updatedItems =
          state.items.where((item) => item.itemName != event.itemName).toList();

      emit(state.copyWith(
        status: updatedItems.isEmpty ? CartStatus.initial : CartStatus.loaded,
        items: updatedItems,
      ));
    });

    on<CheckoutEvent>((event, emit) async {
      emit(state.copyWith(status: CartStatus.orderLoading));
      final orderModel = OrderModel(
        itemName: event.itemName,
        itemPicture: event.itemPicture,
        itemPrice: event.itemPrice,
        quantity: event.quantity,
        itemTotal: event.itemTotal,
      );

      final failureOrUnit = await placeOrderUseCase(orderModel);
      failureOrUnit.fold(
        (failure) => emit(state.copyWith(
          status: CartStatus.orderError,
          messege: mapFailureToMessage(failure),
        )),
        (_) => emit(state.copyWith(
          status: CartStatus.orderSuccess,
        )),
      );
    });
  }
}
