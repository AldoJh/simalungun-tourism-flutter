part of 'restaurant_detail_bloc.dart';

sealed class RestaurantDetailEvent extends Equatable {
  const RestaurantDetailEvent();

  @override
  List<Object> get props => [];
}

final class FetchRestaurantDetailEvent extends RestaurantDetailEvent {
  final int id;
  FetchRestaurantDetailEvent({required this.id});

  @override
  List<Object> get props => [id];
}
