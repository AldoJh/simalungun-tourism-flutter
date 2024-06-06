import 'package:equatable/equatable.dart';
import 'package:simalungun_tourism/domain/entity/hotel_detail_entity.dart';

class HotelDetailModel extends Equatable {
  final num? response;
  final bool? success;
  final String? message;
  final Data? data;

  HotelDetailModel({
    this.response,
    this.success,
    this.message,
    this.data,
  });

  factory HotelDetailModel.fromJson(Map<String, dynamic> json) =>
      HotelDetailModel(
        response: json["response"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

      HotelDetailEntity toEntity() => HotelDetailEntity(
        response: response,
        success: success,
        message: message,
        data: data?.toEntity(),
      );

  @override
  // TODO: implement props
  List<Object?> get props => [response, success, message, data];
}

class Data extends Equatable {
  final num? id;
  final String? slug;
  final String? name;
  final String? owner;
  final String? phone;
  final String? roomCount;
  final Price? price;
  final Rating? rating;
  final Category? category;
  final String? image;
  final String? metaDescription;
  final String? description;
  final Location? location;
  final List<String>? images;
  final List<Category>? facilities;
  final bool? isVerified;
  final Share? share;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Data({
    this.id,
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
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        owner: json["owner"],
        phone: json["phone"],
        roomCount: json["roomCount"],
        price: json["price"] == null ? null : Price.fromJson(json["price"]),
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
        isVerified: json["isVerified"],
        share: json["share"] == null ? null : Share.fromJson(json["share"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

      DataEntity toEntity() => DataEntity(
        id: id,
        slug: slug,
        name: name,
        owner: owner,
        phone: phone,
        roomCount: roomCount,
        price: price?.toEntity(),
        rating: rating?.toEntity(),
        category: category?.toEntity(),
        image: image,
        metaDescription: metaDescription,
        description: description,
        location: location?.toEntity(),
        images: images,
        facilities: facilities?.map((e) => e.toEntity()).toList(),
        isVerified: isVerified,
        share: share?.toEntity(),
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

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

class Category extends Equatable {
  final num? id;
  final String? name;

  Category({
    this.id,
    this.name,
  });

  CategoryEntity toEntity() => CategoryEntity(
        id: id,
        name: name,
      );

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
      );

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
        district: district?.toEntity(),
        village: village?.toEntity(),
        longitude: longitude,
        latitude: latitude,
        address: address,
        maps: maps,
      );

  @override
  // TODO: implement props
  List<Object?> get props =>
      [district, village, longitude, latitude, address, maps];
}

class Price extends Equatable {
  final num? min;
  final num? max;

  Price({
    this.min,
    this.max,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        min: json["min"],
        max: json["max"],
      );

      PriceEntity toEntity() => PriceEntity(
        min: min,
        max: max,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [min, max];
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

      RatingEntity toEntity() => RatingEntity(
        rate: rate,
        count: count,
      );

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

      ShareEntity toEntity() => ShareEntity(
        facebook: facebook,
        linkedin: linkedin,
        whatsapp: whatsapp,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [facebook, linkedin, whatsapp];
}
