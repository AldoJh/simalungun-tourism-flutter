// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:simalungun_tourism/domain/entity/festival_entity.dart';

class FestivalModel extends Equatable {
  int? response;
  bool? success;
  String? message;
  Meta? meta;
  List<Data>? data;

  FestivalModel(
      {this.response, this.success, this.message, this.meta, this.data});

  FestivalModel.fromJson(Map<String, dynamic> json) {
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

  FestivalEntity toEntity() => FestivalEntity(
      response: response,
      success: success,
      message: message,
      meta: meta!.toEntity(),
      data: data!.map((e) => e.toEntity()).toList());

  @override
  // TODO: implement props
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

class Data extends Equatable {
  int? id;
  String? slug;
  String? name;
  String? date;
  int? price;
  String? image;
  String? description;
  Location? location;
  List<String>? images;
  List<String>? attribute;
  Share? share;
  String? createdAt;
  String? updatedAt;

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    name = json['name'];
    date = json['date'];
    price = json['price'];
    image = json['image'];
    description = json['description'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    images = json['images'].cast<String>();
    attribute = json['attribute'].cast<String>();
    share = json['share'] != null ? new Share.fromJson(json['share']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  DataEntity toEntity() => DataEntity(
      id: id,
      slug: slug,
      name: name,
      date: date,
      price: price,
      image: image,
      description: description,
      location: location?.toEntity(),
      images: images,
      attribute: attribute,
      share: share?.toEntity(),
      createdAt: createdAt,
      updatedAt: updatedAt);

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        slug,
        name,
        date,
        price,
        image,
        description,
        location,
        images,
        attribute,
        share,
        createdAt,
        updatedAt
      ];
}

class Location extends Equatable {
  int? longitude;
  int? latitude;
  String? address;
  String? maps;

  Location({this.longitude, this.latitude, this.address, this.maps});

  Location.fromJson(Map<String, dynamic> json) {
    longitude = json['longitude'];
    latitude = json['latitude'];
    address = json['address'];
    maps = json['maps'];
  }

  LocationEntity toEntity() => LocationEntity(
      longitude: longitude, latitude: latitude, address: address, maps: maps);

  @override
  // TODO: implement props
  List<Object?> get props => [longitude, latitude, address, maps];
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
