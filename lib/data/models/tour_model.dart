import 'package:equatable/equatable.dart';
import 'package:simalungun_tourism/domain/entity/tour_entity.dart';

class TourModel extends Equatable {
  final num? response;
  final bool? success;
  final String? message;
  final Meta? meta;
  final List<Datum>? data;

  TourModel({
    this.response,
    this.success,
    this.message,
    this.meta,
    this.data,
  });

  factory TourModel.fromJson(Map<String, dynamic> json) => TourModel(
        response: json["response"],
        success: json["success"],
        message: json["message"],
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  TourEntity toEntity() => TourEntity(
        response: response,
        success: success,
        message: message,
        meta: meta!.toEntity(),
        data: data!.map((e) => e.toEntity()).toList(),
      );

  @override
  // TODO: implement props
  List<Object?> get props => [response, success, message, meta, data];
}

class Datum extends Equatable {
  final num? id;
  final String? slug;
  final String? name;
  final String? phone;
  final Rating? rating;
  final Category? category;
  final String? image;
  final String? metaDescription;
  final String? description;
  final Location? location;
  final List<String>? images;
  final List<Category>? facilities;
  final bool? isRecomended;
  final Share? share;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        phone: json["phone"],
        rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        image: json["image"],
        metaDescription: json["metaDescription"],
        description: json["description"],
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        facilities: json["facilities"] == null
            ? []
            : List<Category>.from(
                json["facilities"]!.map((x) => Category.fromJson(x))),
        isRecomended: json["isRecomended"],
        share: json["share"] == null ? null : Share.fromJson(json["share"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  DatumEntity toEntity() => DatumEntity(
        id: id,
        slug: slug,
        name: name,
        phone: phone,
        rating: rating!.toEntity(),
        category: category!.toEntity(),
        image: image,
        metaDescription: metaDescription,
        description: description,
        location: location!.toEntity(),
        images: images,
        facilities: facilities!.map((e) => e.toEntity()).toList(),
        isRecomended: isRecomended,
        share: share!.toEntity(),
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

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

class Category extends Equatable {
  final num? id;
  final String? name;

  Category({
    this.id,
    this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
      );

  CategoryEntity toEntity() => CategoryEntity(id: id, name: name);

  @override
  // TODO: implement props
  List<Object?> get props => [id, name];
}

class Location extends Equatable {
  final Category? district;
  final Category? village;
  final String? longitude;
  final String? latitude;
  final String? address;
  final String? maps;

  Location({
    this.district,
    this.village,
    this.longitude,
    this.latitude,
    this.address,
    this.maps,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        district: json["district"] == null
            ? null
            : Category.fromJson(json["district"]),
        village:
            json["village"] == null ? null : Category.fromJson(json["village"]),
        longitude: json["longitude"],
        latitude: json["latitude"],
        address: json["address"],
        maps: json["maps"],
      );

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

class Rating extends Equatable {
  final num? rate;
  final num? count;

  Rating({
    this.rate,
    this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"],
        count: json["count"],
      );

  RatingEntity toEntity() => RatingEntity(rate: rate, count: count);

  @override
  // TODO: implement props
  List<Object?> get props => [rate, count];
}

class Share extends Equatable {
  final String? facebook;
  final String? linkedin;
  final String? whatsapp;

  Share({
    this.facebook,
    this.linkedin,
    this.whatsapp,
  });

  factory Share.fromJson(Map<String, dynamic> json) => Share(
        facebook: json["facebook"],
        linkedin: json["linkedin"],
        whatsapp: json["whatsapp"],
      );

  ShareEntity toEntity() =>
      ShareEntity(facebook: facebook, linkedin: linkedin, whatsapp: whatsapp);

  @override
  // TODO: implement props
  List<Object?> get props => [facebook, linkedin, whatsapp];
}

class Meta extends Equatable {
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

  Meta({
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

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        query: json["query"],
        path: json["path"],
        total: json["total"],
        perPage: json["perPage"],
        currentPage: json["currentPage"],
        lastPage: json["lastPage"],
        from: json["from"],
        to: json["to"],
        hasNext: json["hasNext"],
        hasPrevious: json["hasPrevious"],
      );

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
