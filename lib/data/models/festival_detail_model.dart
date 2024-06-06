// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:simalungun_tourism/domain/entity/festival_detail_entity.dart';

class FestivalDetailModel extends Equatable {
  int? response;
  bool? success;
  String? message;
  Data? data;

  FestivalDetailModel({this.response, this.success, this.message, this.data});

  FestivalDetailModel.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
  
  FestivalDetailEntity toEntity() => FestivalDetailEntity(
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

  LocationEntity toEntity() =>
      LocationEntity(longitude: longitude, latitude: latitude, address: address, maps: maps);

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

  ShareEntity toEntity() => ShareEntity(
      facebook: facebook, linkedin: linkedin, whatsapp: whatsapp);

  @override
  // TODO: implement props
  List<Object?> get props => [facebook, linkedin, whatsapp];
}
