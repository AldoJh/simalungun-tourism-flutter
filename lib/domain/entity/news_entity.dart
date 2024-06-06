// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class NewsEntity extends Equatable {
  int? response;
  bool? success;
  String? message;
  MetaEntity? meta;
  List<DataEntity>? data;

  NewsEntity({this.response, this.success, this.message, this.meta, this.data});



  @override
  // TODO: implement props
  List<Object?> get props => [response, success, message, meta, data];
}

class MetaEntity extends Equatable {
  String? query;
  String? path;
  int? total;
  int? perPage;
  int? currentPage;
  int? lastPage;
  int? from;
  int? to;
  bool? hasNext;
  bool? hasPrevious;

  MetaEntity(
      {this.query,
      this.path,
      this.total,
      this.perPage,
      this.currentPage,
      this.lastPage,
      this.from,
      this.to,
      this.hasNext,
      this.hasPrevious});

  @override
  // TODO: implement props
  List<Object?> get props => [
        query,
        path,
        total,
        perPage,
        currentPage,
        lastPage,
        from,
        to,
        hasNext,
        hasPrevious
      ];
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
  AuthorEntity? author;
  ShareEntity? share;
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
        createdAt,
        updatedAt
      ];
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
