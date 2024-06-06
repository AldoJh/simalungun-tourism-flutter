part of 'tour_detail_bloc.dart';

sealed class TourDetailEvent extends Equatable {
  const TourDetailEvent();

  @override
  List<Object> get props => [];
}

final class FetchTourDetailEvent extends TourDetailEvent {
  final int id;

  FetchTourDetailEvent({required this.id});

  @override
  List<Object> get props => [id];
}
