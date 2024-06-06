// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class FestivalEntity extends Equatable {
  int? response;
  bool? success;
  String? message;
  MetaEntity? meta;
  List<DataEntity>? data;

  FestivalEntity(
      {this.response, this.success, this.message, this.meta, this.data});

 
  
  @override
  // TODO: implement props
  List<Object?> get props => [response, success, message, meta, data];
}

class MetaEntity extends Equatable{
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
  List<Object?> get props => [query, path, total, perPage, currentPage, lastPage, from, to, hasNext, hasPrevious];
}

class DataEntity extends Equatable{
  int? id;
  String? slug;
  String? name;
  String? date;
  int? price;
  String? image;
  String? description;
  LocationEntity? location;
  List<String>? images;
  List<String>? attribute;
  ShareEntity? share;
  String? createdAt;
  String? updatedAt;

  DataEntity(
      {this.id,
      this.slug,
      this.name,
      this.date,
      this.price,
      this.image,
      this.description,
      this.location,
      this.images,
      this.attribute,
      this.share,
      this.createdAt,
      this.updatedAt});


  
  @override
  // TODO: implement props
  List<Object?> get props => [id, slug, name, date, price, image, description, location, images, attribute, share, createdAt, updatedAt];
}

class LocationEntity extends Equatable{
  int? longitude;
  int? latitude;
  String? address;
  String? maps;

  LocationEntity({this.longitude, this.latitude, this.address, this.maps});

  
  @override
  // TODO: implement props
  List<Object?> get props => [longitude, latitude, address, maps];
}

class ShareEntity extends Equatable{
  String? facebook;
  String? linkedin;
  String? whatsapp;

  ShareEntity({this.facebook, this.linkedin, this.whatsapp});

  @override
  // TODO: implement props
  List<Object?> get props => [facebook, linkedin, whatsapp];
}
