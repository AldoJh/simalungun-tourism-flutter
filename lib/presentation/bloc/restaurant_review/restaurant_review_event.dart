part of 'restaurant_review_bloc.dart';

sealed class RestaurantReviewEvent extends Equatable {
  const RestaurantReviewEvent();

  @override
  List<Object> get props => [];
}

final class FetchRestaurantReviewEvent extends RestaurantReviewEvent {
  final int id;
  FetchRestaurantReviewEvent({required this.id});

  @override
  List<Object> get props => [id];
}

final class AddRestaurantReviewEvent extends RestaurantReviewEvent {
  final int id;
  final int rate;
  final String review;
  AddRestaurantReviewEvent({required this.id, required this.rate, required this.review});

  @override
  List<Object> get props => [id, rate, review];
}
