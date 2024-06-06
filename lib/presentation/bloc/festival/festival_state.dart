part of 'festival_bloc.dart';

sealed class FestivalState extends Equatable {
  const FestivalState();
  
  @override
  List<Object> get props => [];
}

final class FestivalInitial extends FestivalState {}

final class FestivalLoading extends FestivalState {}

final class FestivalLoaded extends FestivalState {
  final  List<DataEntity> festival;
  final MetaEntity meta;

  FestivalLoaded({required this.festival, required this.meta});

  @override
  List<Object> get props => [festival];
}

final class FestivalError extends FestivalState {
  final String message;

  FestivalError({required this.message});

  @override
  List<Object> get props => [message];
}

