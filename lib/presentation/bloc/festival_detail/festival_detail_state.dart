part of 'festival_detail_bloc.dart';

sealed class FestivalDetailState extends Equatable {
  const FestivalDetailState();
  
  @override
  List<Object> get props => [];
}

final class FestivalDetailInitial extends FestivalDetailState {}

final class FestivalDetailLoading extends FestivalDetailState {}

final class FestivalDetailError extends FestivalDetailState {
  final String message;

  FestivalDetailError({required this.message});

  @override
  List<Object> get props => [message];
}

final class FestivalDetailLoaded extends FestivalDetailState {
  final FestivalDetailEntity? festival;

  FestivalDetailLoaded({this.festival});

  @override
  List<Object> get props => [festival!];
}
