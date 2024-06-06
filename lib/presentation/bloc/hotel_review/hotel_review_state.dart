part of 'hotel_review_bloc.dart';

sealed class HotelReviewState extends Equatable {
  const HotelReviewState();
  
  @override
  List<Object> get props => [];
}

final class HotelReviewInitial extends HotelReviewState {}

final class HotelReviewLoading extends HotelReviewState {}

final class HotelReviewLoaded extends HotelReviewState {
  final HotelReviewEntity hotelReview;
  HotelReviewLoaded({required this.hotelReview});

  @override
  List<Object> get props => [hotelReview];
}

final class HotelReviewError extends HotelReviewState {
  final String message;
  HotelReviewError({required this.message});

  @override
  List<Object> get props => [message];
}

final class HotelReviewAdded extends HotelReviewState {
  final ReviewEntity hotelReview;
  HotelReviewAdded({required this.hotelReview});

  @override
  List<Object> get props => [hotelReview];
}
