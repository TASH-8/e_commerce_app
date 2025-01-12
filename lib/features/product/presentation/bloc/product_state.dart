// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_bloc.dart';

enum ProductStatus { initial, loaded }

class ProductState extends Equatable {
  @override
  List<Object?> get props => [
        itemName,
        itemPicture,
        itemPrice,
        status,
      ];
  final String? itemName;
  final String? itemPicture;
  final double? itemPrice;
  final ProductStatus status;

  const ProductState({
    this.itemName,
     this.itemPicture,
    this.itemPrice,
    required this.status,
  });

  ProductState copyWith({
    String? itemName,
    String? itemPicture,
    double? itemPrice,
    ProductStatus? status,
  }) {
    return ProductState(
      itemName: itemName ?? this.itemName,
      itemPicture: itemPicture ?? this.itemPicture,
      itemPrice: itemPrice ?? this.itemPrice,
      status: status ?? this.status,
    );
  }
}
