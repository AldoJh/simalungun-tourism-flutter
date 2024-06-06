part of 'restaurant_menu_bloc.dart';

sealed class RestaurantMenuState extends Equatable {
  const RestaurantMenuState();
  
  @override
  List<Object> get props => [];
}

final class RestaurantMenuInitial extends RestaurantMenuState {}

final class RestaurantMenuLoading extends RestaurantMenuState {}

final class RestaurantMenuLoaded extends RestaurantMenuState {
  final RestaurantMenuEntity restaurantMenu;

  const RestaurantMenuLoaded({required this.restaurantMenu});

  @override
  List<Object> get props => [restaurantMenu];
}

final class RestaurantMenuError extends RestaurantMenuState {
  final String message;

  const RestaurantMenuError({required this.message});

  @override
  List<Object> get props => [message];
}
