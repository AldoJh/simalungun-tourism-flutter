import 'package:equatable/equatable.dart';

class TourDetailEntity extends Equatable {
  final num? response;
  final bool? success;
  final String? message;
  final DataEntity? data;

  TourDetailEntity({
    this.response,
    this.success,
    this.message,
    this.data,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [response, success, message, data];
}

class DataEntity extends Equatable {
  final num? id;
  final String? slug;
  final String? name;
  final String? phone;
  final RatingEntity? rating;
  final CategoryEntity? category;
  final String? image;
  final String? metaDescription;
  final String? description;
  final LocationEntity? location;
  final List<String>? images;
  final List<CategoryEntity>? facilities;
  final bool? isRecomended;
  final ShareEntity? share;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  DataEntity({
    this.id,
    this.slug,
    this.name,
    this.phone,
    this.rating,
    this.category,
    this.image,
    this.metaDescription,
    this.description,
    this.location,
    this.images,
    this.facilities,
    this.isRecomended,
    this.share,
    this.createdAt,
    this.updatedAt,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        slug,
        name,
        phone,
        rating,
        category,
        image,
        metaDescription,
        description,
        location,
        images,
        facilities,
        isRecomended,
        share,
        createdAt,
        updatedAt
      ];
}

class CategoryEntity extends Equatable {
  final num? id;
  final String? name;

  CategoryEntity({
    this.id,
    this.name,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id, name];
}

class LocationEntity extends Equatable {
  final CategoryEntity? district;
  final CategoryEntity? village;
  final String? longitude;
  final String? latitude;
  final String? address;
  final String? maps;

  LocationEntity({
    this.district,
    this.village,
    this.longitude,
    this.latitude,
    this.address,
    this.maps,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>
      [district, village, longitude, latitude, address, maps];
}

class RatingEntity extends Equatable {
  final num? rate;
  final num? count;

  RatingEntity({
    this.rate,
    this.count,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [rate, count];
}

class ShareEntity extends Equatable {
  final String? facebook;
  final String? linkedin;
  final String? whatsapp;

  ShareEntity({
    this.facebook,
    this.linkedin,
    this.whatsapp,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [facebook, linkedin, whatsapp];
}
