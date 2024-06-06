part of 'news_bloc.dart';

sealed class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class FetchNewsEvent extends NewsEvent {
  final String query;

  FetchNewsEvent({required this.query});

  @override
  List<Object> get props => [query];
}

class FetchMoreNewsEvent extends NewsEvent {
  FetchMoreNewsEvent();

  @override
  List<Object> get props => [];
}
