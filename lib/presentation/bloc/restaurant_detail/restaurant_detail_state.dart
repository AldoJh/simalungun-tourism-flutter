part of 'restaurant_detail_bloc.dart';

sealed class RestaurantDetailState extends Equatable {
  const RestaurantDetailState();
  
  @override
  List<Object> get props => [];
}

final class RestaurantDetailInitial extends RestaurantDetailState {}

final class RestaurantDetailLoading extends RestaurantDetailState {}

final class RestaurantDetailLoaded extends RestaurantDetailState {
  final RestaurantDetailEntity restaurant;
  RestaurantDetailLoaded({required this.restaurant});

  @override
  List<Object> get props => [restaurant];
}

final class RestaurantDetailError extends RestaurantDetailState {
  final String message;
  RestaurantDetailError({required this.message});

  @override
  List<Object> get props => [message];
}
