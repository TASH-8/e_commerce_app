part of 'items_bloc.dart';

sealed class ItemsEvent extends Equatable {
  const ItemsEvent();

  @override
  List<Object> get props => [];
}
class GetAllItemsEvent extends ItemsEvent{}
