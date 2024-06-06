// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:simalungun_tourism/domain/entity/news_entity.dart';

class NewsModel extends Equatable {
  int? response;
  bool? success;
  String? message;
  Meta? meta;
  List<Data>? data;

  NewsModel({this.response, this.success, this.message, this.meta, this.data});

  NewsModel.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    success = json['success'];
    message = json['message'];
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  NewsEntity toEntity() => NewsEntity(
      response: response,
      success: success,
      message: message,
      meta: meta!.toEntity(),
      data: data!.map((e) => e.toEntity()).toList());

  @override
  List<Object?> get props => [response, success, message, meta, data];
}

class Meta extends Equatable {
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

  Meta(
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

  Meta.fromJson(Map<String, dynamic> json) {
    query = json['query'];
    path = json['path'];
    total = json['total'];
    perPage = json['perPage'];
    currentPage = json['currentPage'];
    lastPage = json['lastPage'];
    from = json['from'];
    to = json['to'];
    hasNext = json['hasNext'];
    hasPrevious = json['hasPrevious'];
  }

  MetaEntity toEntity() => MetaEntity(
      query: query,
      path: path,
      total: total,
      perPage: perPage,
      currentPage: currentPage,
      lastPage: lastPage,
      from: from,
      to: to,
      hasNext: hasNext,
      hasPrevious: hasPrevious);

  @override
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

class Data extends Equatable {
  int? id;
  String? slug;
  String? title;
  String? date;
  dynamic description;
  String? content;
  String? image;
  List<String>? images;
  Author? author;
  Share? share;
  String? createdAt;
  String? updatedAt;

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    title = json['title'];
    date = json['date'];
    description = json['description'];
    content = json['content'];
    image = json['image'];
    images = json['images'].cast<String>();
    author =
        json['author'] != null ? new Author.fromJson(json['author']) : null;
    share = json['share'] != null ? new Share.fromJson(json['share']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  DataEntity toEntity() => DataEntity(
      id: id,
      slug: slug,
      title: title,
      date: date,
      description: description,
      content: content,
      image: image,
      images: images,
      author: author!.toEntity(),
      share: share!.toEntity(),
      createdAt: createdAt,
      updatedAt: updatedAt);

  @override
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

class Author extends Equatable {
  int? id;
  String? name;
  String? image;

  Author({this.id, this.name, this.image});

  Author.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  AuthorEntity toEntity() => AuthorEntity(id: id, name: name, image: image);

  @override
  List<Object?> get props => [id, name, image];
}

class Share extends Equatable {
  String? facebook;
  String? linkedin;
  String? whatsapp;

  Share({this.facebook, this.linkedin, this.whatsapp});

  Share.fromJson(Map<String, dynamic> json) {
    facebook = json['facebook'];
    linkedin = json['linkedin'];
    whatsapp = json['whatsapp'];
  }

  ShareEntity toEntity() =>
      ShareEntity(facebook: facebook, linkedin: linkedin, whatsapp: whatsapp);

  @override
  List<Object?> get props => [facebook, linkedin, whatsapp];
}
