part of 'tour_review_bloc.dart';

sealed class TourReviewEvent extends Equatable {
  const TourReviewEvent();

  @override
  List<Object> get props => [];
}

final class FetchTourReviewEvent extends TourReviewEvent {
  final int id;

  FetchTourReviewEvent({required this.id});

  @override
  List<Object> get props => [id];
}

final class AddTourReviewEvent extends TourReviewEvent {
  final int id;
  final String review;
  final int rating;

  AddTourReviewEvent({required this.id, required this.review, required this.rating});

  @override
  List<Object> get props => [id, review, rating];
}
