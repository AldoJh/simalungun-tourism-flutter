

import 'package:equatable/equatable.dart';

class RestaurantEntity extends Equatable {
    final num? response;
    final bool? success;
    final String? message;
    final MetaEntity? meta;
    final List<DatumEntity>? data;

    RestaurantEntity({
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

class DatumEntity extends Equatable{
    final num? id;
    final String? slug;
    final String? name;
    final String? label;
    final String? owner;
    final String? phone;
    final num? tableCount;
    final num? chairCount;
    final RatingEntity? rating;
    final String? image;
    final String? metaDescription;
    final dynamic description;
    final LocationEntity? location;
    final List<String>? images;
    final List<FacilityEntity>? facilities;
    final bool? isRecomended;
    final ShareEntity? share;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    DatumEntity({
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
    
      @override
      // TODO: implement props
      List<Object?> get props => [id, slug, name, label, owner, phone, tableCount, chairCount, rating, image, metaDescription, description, location, images, facilities, isRecomended, share, createdAt, updatedAt];
}

class FacilityEntity extends Equatable{
    final num? id;
    final String? name;

    FacilityEntity({
        this.id,
        this.name,
    });
    
      @override
      // TODO: implement props
      List<Object?> get props => [id, name];
}

class LocationEntity extends Equatable{
    final FacilityEntity? district;
    final FacilityEntity? village;
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
      List<Object?> get props => [district, village, longitude, latitude, address, maps];
}


class RatingEntity extends Equatable{
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

class ShareEntity extends Equatable{
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

class MetaEntity extends Equatable{
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
      List<Object?> get props => [query, path, total, perPage, currentPage, lastPage, from, to, hasNext, hasPrevious];
}