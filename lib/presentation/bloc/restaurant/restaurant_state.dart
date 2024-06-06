part of 'restaurant_bloc.dart';

sealed class RestaurantState extends Equatable {
  const RestaurantState();
  
  @override
  List<Object> get props => [];
}

final class RestaurantInitial extends RestaurantState {}

final class RestaurantLoading extends RestaurantState {}

final class RestaurantLoaded extends RestaurantState {
  final List<DatumEntity> restaurants;
  final MetaEntity meta;

  RestaurantLoaded({required this.restaurants, required this.meta});

  @override
  List<Object> get props => [restaurants, meta];
}

final class RestaurantError extends RestaurantState {
  final String message;

  RestaurantError({required this.message});

  @override
  List<Object> get props => [message];
}
