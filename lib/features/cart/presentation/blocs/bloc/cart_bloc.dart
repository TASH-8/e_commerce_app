import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/cart/presentation/blocs/bloc/cart_state.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState(status: CartStatus.initial)) {
    on<CartEvent>((event, emit) {
      if (event is GetProductToCartEvent) {
        emit(state.copyWith(
          status: CartStatus.loaded,
          itemName: event.itemName,
          itemPicture: event.itemPicture,
          itemPrice: event.itemPrice,
        ));
      } else if (event is IncrementEvent) {
        // Prevent quantity from exceeding 5
        if (state.quantity! < 5) {
          emit(state.copyWith(
            quantity: state.quantity! + 1,
          ));
        }
      } else if (event is DecreameantEvent) {
        // Prevent quantity from going below 1
        if (state.quantity! > 1) {
          emit(state.copyWith(
            quantity: state.quantity! - 1,
          ));
        }
      }
    });
  }
}

