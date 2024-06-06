part of 'restaurant_menu_bloc.dart';

sealed class RestaurantMenuEvent extends Equatable {
  const RestaurantMenuEvent();

  @override
  List<Object> get props => [];
}

final class FetchRestaurantMenuEvent extends RestaurantMenuEvent {
  final int id;

  const FetchRestaurantMenuEvent({required this.id});

  @override
  List<Object> get props => [id];
}