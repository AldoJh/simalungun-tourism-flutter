part of 'tour_review_bloc.dart';

sealed class TourReviewState extends Equatable {
  const TourReviewState();
  
  @override
  List<Object> get props => [];
}

final class TourReviewInitial extends TourReviewState {}

final class TourReviewLoading extends TourReviewState {}

final class TourReviewLoaded extends TourReviewState {
  final TourReviewEntity tourReviews;

  const TourReviewLoaded({required this.tourReviews});

  @override
  List<Object> get props => [tourReviews];
}

final class TourReviewError extends TourReviewState {
  final String message;

  const TourReviewError({required this.message});

  @override
  List<Object> get props => [message];
}

final class TourReviewAdded extends TourReviewState {
  final ReviewEntity tourReview;

  const TourReviewAdded({required this.tourReview});

  @override
  List<Object> get props => [tourReview];
}

