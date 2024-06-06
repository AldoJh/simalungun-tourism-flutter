import 'package:equatable/equatable.dart';

class TourEntity extends Equatable {
  final num? response;
  final bool? success;
  final String? message;
  final MetaEntity? meta;
  final List<DatumEntity>? data;

  TourEntity({
    this.response,
    this.success,
    this.message,
    this.meta,
    this.data,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [response, success, message, meta, data];
}

class DatumEntity extends Equatable {
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

  DatumEntity({
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
        updatedAt,
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

class MetaEntity extends Equatable {
  final String? query;
  final String? path;
  final num? total;
  final num? perPage;
  final num? currentPage;
  final num? lastPage;
  final num? from;
  final num? to;
  final bool? hasNext;
  final bool? hasPrevious;

  MetaEntity({
    this.query,
    this.path,
    this.total,
    this.perPage,
    this.currentPage,
    this.lastPage,
    this.from,
    this.to,
    this.hasNext,
    this.hasPrevious,
  });

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
