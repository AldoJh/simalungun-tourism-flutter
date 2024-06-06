part of 'tour_bloc.dart';

sealed class TourState extends Equatable {
  const TourState();
  
  @override
  List<Object> get props => [];
}

final class TourInitial extends TourState {}

final class TourLoading extends TourState {}

final class TourLoaded extends TourState {
  final List<DatumEntity> tours;
  final MetaEntity meta;

  TourLoaded({required this.tours, required this.meta});

  @override
  List<Object> get props => [tours, meta];
}

final class TourError extends TourState {
  final String message;

  TourError({required this.message});

  @override
  List<Object> get props => [message];
}


