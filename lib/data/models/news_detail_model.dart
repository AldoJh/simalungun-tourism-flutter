// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:simalungun_tourism/domain/entity/news_detail_entity.dart';

class NewsDetailModel extends Equatable {
  int? response;
  bool? success;
  String? message;
  Data? data;

  NewsDetailModel({this.response, this.success, this.message, this.data});

  NewsDetailModel.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  NewsDetailEntity toEntity() => NewsDetailEntity(
      response: response,
      success: success,
      message: message,
      data: data?.toEntity());

  @override
  // TODO: implement props
  List<Object?> get props => [response, success, message, data];
}

class Data extends Equatable {
  int? id;
  String? slug;
  String? title;
  String? date;
  String? description;
  String? content;
  String? image;
  List<String>? images;
  Author? author;
  Share? share;
  List<Comment>? comment;
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
      this.comment,
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
    comment =
    json["comment"] == null
        ? []
        : List<Comment>.from(json["comment"]!.map((x) => Comment.fromJson(x)));
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
      comment: comment!.map((e) => e.toEntity()).toList(),
      createdAt: createdAt,
      updatedAt: updatedAt);

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

class Comment extends Equatable {
  final int? id;
  final String? content;
  final Author? user;

  Comment({
    this.id,
    this.content,
    this.user,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["id"],
        content: json["content"],
        user: json["user"] == null ? null : Author.fromJson(json["user"]),
      );

  CommentEntity toEntity() =>
      CommentEntity(id: id, content: content, user: user!.toEntity());
      

  @override
  // TODO: implement props
  List<Object?> get props => [id, content, user];
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
  // TODO: implement props
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
  // TODO: implement props
  List<Object?> get props => [facebook, linkedin, whatsapp];
}
