import 'package:equatable/equatable.dart';

class TourGuideEntity extends Equatable {
  final int? response;
  final bool? success;
  final String? message;
  final List<DatumEntity>? data;

  TourGuideEntity({
    this.response,
    this.success,
    this.message,
    this.data,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [response, success, message, data];
}

class DatumEntity extends Equatable {
  final int? id;
  final String? name;
  final String? image;
  final String? gender;
  final String? religion;
  final String? country;
  final DateTime? birthdate;
  final String? phone;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  DatumEntity({
    this.id,
    this.name,
    this.image,
    this.gender,
    this.religion,
    this.country,
    this.birthdate,
    this.phone,
    this.createdAt,
    this.updatedAt,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        image,
        gender,
        religion,
        country,
        birthdate,
        phone,
        createdAt,
        updatedAt
      ];
}
