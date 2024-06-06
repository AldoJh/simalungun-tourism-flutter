// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class HotelEntity extends Equatable {
  num? response;
  bool? success;
  String? message;
  MetaEntity? meta;
  List<DataEntity>? data;

  HotelEntity(
      {this.response, this.success, this.message, this.meta, this.data});

  @override
  // TODO: implement props
  List<Object?> get props => [response, success, message, meta, data];
}

class MetaEntity extends Equatable {
  String? query;
  String? path;
  num? total;
  num? perPage;
  num? currentPage;
  num? lastPage;
  num? from;
  num? to;
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
  num? id;
  String? slug;
  String? name;
  String? owner;
  String? phone;
  String? roomCount;
  PriceEntity? price;
  RatingEntity? rating;
  CategoryEntity? category;
  String? image;
  String? metaDescription;
  String? description;
  LocationEntity? location;
  List<String>? images;
  List<CategoryEntity>? facilities;
  bool? isVerified;
  ShareEntity? share;
  String? createdAt;
  String? updatedAt;

  DataEntity(
      {this.id,
      this.slug,
      this.name,
      this.owner,
      this.phone,
      this.roomCount,
      this.price,
      this.rating,
      this.category,
      this.image,
      this.metaDescription,
      this.description,
      this.location,
      this.images,
      this.facilities,
      this.isVerified,
      this.share,
      this.createdAt,
      this.updatedAt});

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        slug,
        name,
        owner,
        phone,
        roomCount,
        price,
        rating,
        category,
        image,
        metaDescription,
        description,
        location,
        images,
        facilities,
        isVerified,
        share,
        createdAt,
        updatedAt
      ];
}

class PriceEntity extends Equatable {
  num? min;
  num? max;

  PriceEntity({this.min, this.max});

  @override
  // TODO: implement props
  List<Object?> get props => [min, max];
}

class RatingEntity extends Equatable {
  num? rate;
  num? count;

  RatingEntity({this.rate, this.count});

  @override
  // TODO: implement props
  List<Object?> get props => [rate, count];
}

class CategoryEntity extends Equatable {
  num? id;
  String? name;

  CategoryEntity({this.id, this.name});

  @override
  // TODO: implement props
  List<Object?> get props => [id, name];
}

class LocationEntity extends Equatable {
  CategoryEntity? district;
  CategoryEntity? village;
  String? longitude;
  String? latitude;
  String? address;
  String? maps;

  LocationEntity(
      {this.district,
      this.village,
      this.longitude,
      this.latitude,
      this.address,
      this.maps});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [district, village, longitude, latitude, address, maps];
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
