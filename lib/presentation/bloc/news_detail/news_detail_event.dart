part of 'news_detail_bloc.dart';

sealed class NewsDetailEvent extends Equatable {
  const NewsDetailEvent();

  @override
  List<Object> get props => [];
}

class FetchNewsDetailEvent extends NewsDetailEvent {
  final int id;

  FetchNewsDetailEvent({required this.id});

  @override
  List<Object> get props => [id];
}

class AddNewsCommentEvent extends NewsDetailEvent {
  final int newsId;
  final String content;

  AddNewsCommentEvent({required this.newsId, required this.content});

  @override
  List<Object> get props => [newsId, content];
}