part of 'hotel_review_bloc.dart';

sealed class HotelReviewEvent extends Equatable {
  const HotelReviewEvent();

  @override
  List<Object> get props => [];
}

final class FetchHotelReviewEvent extends HotelReviewEvent {
  final int id;
  FetchHotelReviewEvent({required this.id});

  @override
  List<Object> get props => [id];
}

final class AddHotelReviewEvent extends HotelReviewEvent {
  final int id;
  final int rate;
  final String review;
  AddHotelReviewEvent({required this.id, required this.rate, required this.review});

  @override
  List<Object> get props => [id, rate, review];
}
