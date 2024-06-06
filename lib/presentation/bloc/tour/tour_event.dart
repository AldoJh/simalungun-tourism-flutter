part of 'tour_bloc.dart';

sealed class TourEvent extends Equatable {
  const TourEvent();

  @override
  List<Object> get props => [];
}

class FetchTourEvent extends TourEvent {
  final String query;

  FetchTourEvent({required this.query});

  @override
  List<Object> get props => [query];
}

class FetchMoreTourEvent extends TourEvent {
  FetchMoreTourEvent();

  @override
  List<Object> get props => [];
}
