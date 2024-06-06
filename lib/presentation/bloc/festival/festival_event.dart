part of 'festival_bloc.dart';

sealed class FestivalEvent extends Equatable {
  const FestivalEvent();

  @override
  List<Object> get props => [];
}

final class FetchFestivalEvent extends FestivalEvent {
  final String query;

  FetchFestivalEvent({required this.query});

  @override
  List<Object> get props => [query];
}

final class fetchMoreFestivalEvent extends FestivalEvent {
  fetchMoreFestivalEvent();

  @override
  List<Object> get props => [];
}


