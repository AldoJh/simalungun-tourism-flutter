// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:simalungun_tourism/domain/entity/hotel_entity.dart';

class HotelModel extends Equatable {
  num? response;
  bool? success;
  String? message;
  Meta? meta;
  List<Data>? data;

  HotelModel({this.response, this.success, this.message, this.meta, this.data});

  HotelModel.fromJson(Map<String, dynamic> json) {
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

  HotelEntity toEntity() => HotelEntity(
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
  num? total;
  num? perPage;
  num? currentPage;
  num? lastPage;
  num? from;
  num? to;
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
  num? id;
  String? slug;
  String? name;
  String? owner;
  String? phone;
  String? roomCount;
  Price? price;
  Rating? rating;
  Category? category;
  String? image;
  String? metaDescription;
  String? description;
  Location? location;
  List<String>? images;
  List<Category>? facilities;
  bool? isVerified;
  Share? share;
  String? createdAt;
  String? updatedAt;

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    name = json['name'];
    owner = json['owner'];
    phone = json['phone'];
    roomCount = json['roomCount'];
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
    rating =
        json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    image = json['image'];
    metaDescription = json['metaDescription'];
    description = json['description'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    images = json['images'].cast<String>();
    if (json['facilities'] != null) {
      facilities = <Category>[];
      json['facilities'].forEach((v) {
        facilities!.add(new Category.fromJson(v));
      });
    }
    isVerified = json['isVerified'];
    share = json['share'] != null ? new Share.fromJson(json['share']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  DataEntity toEntity() => DataEntity(
      id: id,
      slug: slug,
      name: name,
      owner: owner,
      phone: phone,
      roomCount: roomCount,
      price: price!.toEntity(),
      rating: rating!.toEntity(),
      category: category!.toEntity(),
      image: image,
      metaDescription: metaDescription,
      description: description,
      location: location!.toEntity(),
      images: images,
      facilities: facilities!.map((e) => e.toEntity()).toList(),
      isVerified: isVerified,
      share: share!.toEntity(),
      createdAt: createdAt,
      updatedAt: updatedAt);

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

class Price extends Equatable {
  num? min;
  num? max;

  Price({this.min, this.max});

  Price.fromJson(Map<String, dynamic> json) {
    min = json['min'];
    max = json['max'];
  }

  PriceEntity toEntity() => PriceEntity(min: min, max: max);

  @override
  // TODO: implement props
  List<Object?> get props => [min, max];
}

class Rating extends Equatable {
  num? rate;
  num? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }

  RatingEntity toEntity() => RatingEntity(rate: rate, count: count);

  @override
  // TODO: implement props
  List<Object?> get props => [rate, count];
}

class Category extends Equatable {
  num? id;
  String? name;

  Category({this.id, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  CategoryEntity toEntity() => CategoryEntity(id: id, name: name);

  @override
  // TODO: implement props
  List<Object?> get props => [id, name];
}

class Location extends Equatable {
  Category? district;
  Category? village;
  String? longitude;
  String? latitude;
  String? address;
  String? maps;

  Location(
      {this.district,
      this.village,
      this.longitude,
      this.latitude,
      this.address,
      this.maps});

  Location.fromJson(Map<String, dynamic> json) {
    district = json['district'] != null
        ? new Category.fromJson(json['district'])
        : null;
    village =
        json['village'] != null ? new Category.fromJson(json['village']) : null;
    longitude = json['longitude'];
    latitude = json['latitude'];
    address = json['address'];
    maps = json['maps'];
  }

  LocationEntity toEntity() => LocationEntity(
      district: district!.toEntity(),
      village: village!.toEntity(),
      longitude: longitude,
      latitude: latitude,
      address: address,
      maps: maps);

  @override
  // TODO: implement props
  List<Object?> get props =>
      [district, village, longitude, latitude, address, maps];
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
