part of 'news_detail_bloc.dart';

sealed class NewsDetailState extends Equatable {
  const NewsDetailState();
  
  @override
  List<Object> get props => [];
}

final class NewsDetailInitial extends NewsDetailState {}

final class NewsDetailLoading extends NewsDetailState {}

final class NewsDetailError extends NewsDetailState {
  final String message;

  NewsDetailError({required this.message});

  @override
  List<Object> get props => [message];
}

final class NewsDetailLoaded extends NewsDetailState {
  final NewsDetailEntity? newsDetail;

  NewsDetailLoaded({this.newsDetail});

  @override
  List<Object> get props => [newsDetail!];
}

final class NewsCommentLoaded extends NewsDetailState {
  final NewsCommentEntity? newsComment;

  NewsCommentLoaded({this.newsComment});

  @override
  List<Object> get props => [newsComment!];
}


