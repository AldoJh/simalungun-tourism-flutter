part of 'restaurant_bloc.dart';

sealed class RestaurantEvent extends Equatable {
  const RestaurantEvent();

  @override
  List<Object> get props => [];
}

class FetchRestaurantEvent extends RestaurantEvent {
  final String query;

  FetchRestaurantEvent({required this.query});

  @override
  List<Object> get props => [query];
}

class FetchMoreRestaurantEvent extends RestaurantEvent {
  FetchMoreRestaurantEvent();

  @override
  List<Object> get props => [];
}
