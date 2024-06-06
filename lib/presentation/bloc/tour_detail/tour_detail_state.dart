part of 'tour_detail_bloc.dart';

sealed class TourDetailState extends Equatable {
  const TourDetailState();
  
  @override
  List<Object> get props => [];
}

final class TourDetailInitial extends TourDetailState {}

final class TourDetailLoading extends TourDetailState {}

final class TourDetailLoaded extends TourDetailState {
  final TourDetailEntity tourDetail;

  TourDetailLoaded({required this.tourDetail});

  @override
  List<Object> get props => [tourDetail];
}

final class TourDetailError extends TourDetailState {
  final String message;

  TourDetailError({required this.message});

  @override
  List<Object> get props => [message];
}
