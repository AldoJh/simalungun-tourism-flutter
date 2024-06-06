part of 'tour_guide_bloc.dart';

sealed class TourGuideState extends Equatable {
  const TourGuideState();
  
  @override
  List<Object> get props => [];
}

final class TourGuideInitial extends TourGuideState {}

final class TourGuideLoading extends TourGuideState {}

final class TourGuideLoaded extends TourGuideState {
  final TourGuideEntity tourGuides;

  const TourGuideLoaded({required this.tourGuides});

  @override
  List<Object> get props => [tourGuides];
}

final class TourGuideError extends TourGuideState {
  final String message;

  const TourGuideError({required this.message});

  @override
  List<Object> get props => [message];
}