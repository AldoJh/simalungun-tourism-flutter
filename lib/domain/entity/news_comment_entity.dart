import 'package:equatable/equatable.dart';

class NewsCommentEntity extends Equatable {
  final int? response;
  final bool? success;
  final String? message;
  final ValidationEntity? validation;
  final DataEntity? data;

  NewsCommentEntity({
    this.response,
    this.success,
    this.message,
    this.validation,
    this.data,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [response, success, message, validation, data];
}

class DataEntity extends Equatable {
  final String? newsId;
  final int? userId;
  final String? content;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  DataEntity({
    this.newsId,
    this.userId,
    this.content,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>
      [newsId, userId, content, updatedAt, createdAt, id];
}

class ValidationEntity extends Equatable {
  final List<String>? comment;

  ValidationEntity({
    this.comment,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [comment];
}
