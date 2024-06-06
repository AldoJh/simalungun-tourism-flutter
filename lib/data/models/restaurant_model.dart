

import 'package:equatable/equatable.dart';
import 'package:simalungun_tourism/domain/entity/restaurant_entity.dart';

class RestaurantModel extends Equatable {
    final num? response;
    final bool? success;
    final String? message;
    final Meta? meta;
    final List<Datum>? data;

    RestaurantModel({
        this.response,
        this.success,
        this.message,
        this.meta,
        this.data,
    });

    factory RestaurantModel.fromJson(Map<String, dynamic> json) => RestaurantModel(
        response: json["response"],
        success: json["success"],
        message: json["message"],
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    RestaurantEntity toEntity() => RestaurantEntity(
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

class Datum extends Equatable{
    final num? id;
    final String? slug;
    final String? name;
    final String? label;
    final String? owner;
    final String? phone;
    final num? tableCount;
    final num? chairCount;
    final Rating? rating;
    final String? image;
    final String? metaDescription;
    final dynamic description;
    final Location? location;
    final List<String>? images;
    final List<Facility>? facilities;
    final bool? isRecomended;
    final Share? share;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    Datum({
        this.id,
        this.slug,
        this.name,
        this.label,
        this.owner,
        this.phone,
        this.tableCount,
        this.chairCount,
        this.rating,
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
        label: json["label"]!,
        owner: json["owner"],
        phone: json["phone"],
        tableCount: json["tableCount"],
        chairCount: json["chairCount"],
        rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
        image: json["image"],
        metaDescription: json["metaDescription"]!,
        description: json["description"],
        location: json["location"] == null ? null : Location.fromJson(json["location"]),
        images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
        facilities: json["facilities"] == null ? [] : List<Facility>.from(json["facilities"]!.map((x) => Facility.fromJson(x))),
        isRecomended: json["isRecomended"],
        share: json["share"] == null ? null : Share.fromJson(json["share"]),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    DatumEntity toEntity() => DatumEntity(
        id: id,
        slug: slug,
        name: name,
        label: label,
        owner: owner,
        phone: phone,
        tableCount: tableCount,
        chairCount: chairCount,
        rating: rating!.toEntity(),
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
      List<Object?> get props => [id, slug, name, label, owner, phone, tableCount, chairCount, rating, image, metaDescription, description, location, images, facilities, isRecomended, share, createdAt, updatedAt];
}

class Facility extends Equatable{
    final num? id;
    final String? name;

    Facility({
        this.id,
        this.name,
    });

    factory Facility.fromJson(Map<String, dynamic> json) => Facility(
        id: json["id"],
        name: json["name"],
    );

    FacilityEntity toEntity() => FacilityEntity(
        id: id,
        name: name,
    );
    
      @override
      // TODO: implement props
      List<Object?> get props => [id, name];
}

class Location extends Equatable{
    final Facility? district;
    final Facility? village;
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
        district: json["district"] == null ? null : Facility.fromJson(json["district"]),
        village: json["village"] == null ? null : Facility.fromJson(json["village"]),
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
        maps: maps,
    );
    
      @override
      // TODO: implement props
      List<Object?> get props => [district, village, longitude, latitude, address, maps];
}


class Rating extends Equatable{
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

class Share extends Equatable{
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

class Meta extends Equatable{
    final dynamic query;
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
        hasPrevious: hasPrevious,
    );
    
      @override
      // TODO: implement props
      List<Object?> get props => [query, path, total, perPage, currentPage, lastPage, from, to, hasNext, hasPrevious];
}