// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'items_bloc.dart';

enum ItemsStatus { initial, loading, success, error }

class ItemsState extends Equatable {
  final ItemsStatus status;
  final String messege;
  final List<ItemsEntity> items;

  const ItemsState({
    this.status = ItemsStatus.loading,
    this.messege = '',
    this.items = const [],
  });

  @override
  List<Object?> get props => [status, messege, items];

  ItemsState copyWith({
    ItemsStatus? status,
    String? messege,
    List<ItemsEntity>? items,
  }) {
    return ItemsState(
      status: status ?? this.status,
      messege: messege ?? this.messege,
      items: items ?? this.items,
    );
  }
}
