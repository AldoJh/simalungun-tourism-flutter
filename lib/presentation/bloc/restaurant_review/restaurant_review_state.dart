part of 'restaurant_review_bloc.dart';

sealed class RestaurantReviewState extends Equatable {
  const RestaurantReviewState();
  
  @override
  List<Object> get props => [];
}

final class RestaurantReviewInitial extends RestaurantReviewState {}

final class RestaurantReviewLoading extends RestaurantReviewState {}

final class RestaurantReviewLoaded extends RestaurantReviewState {
  final RestaurantReviewEntity restaurantReview;
  RestaurantReviewLoaded({required this.restaurantReview});

  @override
  List<Object> get props => [restaurantReview];
}

final class RestaurantReviewError extends RestaurantReviewState {
  final String message;
  RestaurantReviewError({required this.message});

  @override
  List<Object> get props => [message];
}

final class RestaurantReviewAdded extends RestaurantReviewState {
  final ReviewEntity restaurantReview;
  RestaurantReviewAdded({required this.restaurantReview});

  @override
  List<Object> get props => [restaurantReview];
}