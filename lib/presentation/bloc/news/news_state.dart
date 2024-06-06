part of 'news_bloc.dart';

sealed class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

final class NewsInitial extends NewsState {}

final class NewsLoading extends NewsState {}

final class NewsError extends NewsState {
  final String message;

  NewsError({required this.message});

  @override
  List<Object> get props => [message];
}

final class NewsLoaded extends NewsState {
  final List<DataEntity> news;
  final MetaEntity meta;

  NewsLoaded({required this.news, required this.meta});

  @override
  List<Object> get props => [news, meta];
}
