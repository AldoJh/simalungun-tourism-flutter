part of 'festival_detail_bloc.dart';

sealed class FestivalDetailEvent extends Equatable {
  const FestivalDetailEvent();

  @override
  List<Object> get props => [];
}

class FetchFestivalDetailEvent extends FestivalDetailEvent {
  final int id;

  FetchFestivalDetailEvent({required this.id});

  @override
  List<Object> get props => [id];
}