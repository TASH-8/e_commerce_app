import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(const ProductState(status: ProductStatus.loaded)) {
    on<ProductEvent>((event, emit) {
      if (event is GetProductDetailEvent) {
        emit(
          state.copyWith(
            status: ProductStatus.loaded,
            itemName: event.itemName,
            itemPicture: event.itemPicture,
            itemPrice: event.itemPrice,
          ),
        );
      }
    });
  }
}
