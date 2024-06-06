part of 'tour_guide_bloc.dart';

sealed class TourGuideEvent extends Equatable {
  const TourGuideEvent();

  @override
  List<Object> get props => [];
}

final class FetchTourGuideEvent extends TourGuideEvent {
  final int id;

  const FetchTourGuideEvent({required this.id});

  @override
  List<Object> get props => [id];
}
