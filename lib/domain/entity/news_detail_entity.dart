// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class NewsDetailEntity extends Equatable {
  int? response;
  bool? success;
  String? message;
  DataEntity? data;

  NewsDetailEntity({this.response, this.success, this.message, this.data});



  @override
  // TODO: implement props
  List<Object?> get props => [response, success, message, data];
}

class DataEntity extends Equatable {
  int? id;
  String? slug;
  String? title;
  String? date;
  String? description;
  String? content;
  String? image;
  List<String>? images;
  AuthorEntity ? author;
  ShareEntity ? share;
  List<CommentEntity>? comment;
  String? createdAt;
  String? updatedAt;

  DataEntity(
      {this.id,
      this.slug,
      this.title,
      this.date,
      this.description,
      this.content,
      this.image,
      this.images,
      this.author,
      this.share,
      this.comment,
      this.createdAt,
      this.updatedAt});



  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        slug,
        title,
        date,
        description,
        content,
        image,
        images,
        author,
        share,
        comment,
        createdAt,
        updatedAt
      ];
}

class CommentEntity extends Equatable {
  final int? id;
  final String? content;
  final AuthorEntity? user;

  CommentEntity({
    this.id,
    this.content,
    this.user,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id, content, user];
}

class AuthorEntity extends Equatable {
  int? id;
  String? name;
  String? image;

  AuthorEntity({this.id, this.name, this.image});


  @override
  // TODO: implement props
  List<Object?> get props => [id, name, image];
}

class ShareEntity extends Equatable {
  String? facebook;
  String? linkedin;
  String? whatsapp;

  ShareEntity({this.facebook, this.linkedin, this.whatsapp});


  @override
  // TODO: implement props
  List<Object?> get props => [facebook, linkedin, whatsapp];
}
