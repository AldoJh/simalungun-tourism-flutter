import 'package:equatable/equatable.dart';
import 'package:simalungun_tourism/domain/entity/news_comment_entity.dart';

class NewsCommentModel extends Equatable {
  final int? response;
  final bool? success;
  final String? message;
  final Validation? validation;
  final Data? data;

  NewsCommentModel({
    this.response,
    this.success,
    this.message,
    this.validation,
    this.data,
  });

  factory NewsCommentModel.fromJson(Map<String, dynamic> json) =>
      NewsCommentModel(
        response: json["response"],
        success: json["success"],
        message: json["message"],
        validation: json["validation"] == null
            ? null
            : Validation.fromJson(json["validation"]),
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  NewsCommentEntity toEntity() => NewsCommentEntity(
        response: response,
        success: success,
        message: message,
        validation: validation?.toEntity(),
        data: data?.toEntityData(),
      );

  @override
  // TODO: implement props
  List<Object?> get props => [response, success, message, validation, data];
}

class Data extends Equatable {
  final String? newsId;
  final int? userId;
  final String? content;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  Data({
    this.newsId,
    this.userId,
    this.content,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        newsId: json["news_id"],
        userId: json["user_id"],
        content: json["content"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  DataEntity toEntityData() => DataEntity(
        newsId: newsId,
        userId: userId,
        content: content,
        updatedAt: updatedAt,
        createdAt: createdAt,
        id: id,
      );

  @override
  // TODO: implement props
  List<Object?> get props =>
      [newsId, userId, content, updatedAt, createdAt, id];
}

class Validation extends Equatable {
  final List<String>? comment;

  Validation({
    this.comment,
  });

  factory Validation.fromJson(Map<String, dynamic> json) => Validation(
        comment: json["comment"] == null
            ? []
            : List<String>.from(json["comment"]!.map((x) => x)),
      );

  ValidationEntity toEntity() => ValidationEntity(
        comment: comment,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [comment];
}
