import 'package:equatable/equatable.dart';
import 'package:simalungun_tourism/domain/entity/tour_guider_entity.dart';

class TourGuideModel extends Equatable {
  final int? response;
  final bool? success;
  final String? message;
  final List<Datum>? data;

  TourGuideModel({
    this.response,
    this.success,
    this.message,
    this.data,
  });

  factory TourGuideModel.fromJson(Map<String, dynamic> json) => TourGuideModel(
        response: json["response"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  TourGuideEntity toEntity() => TourGuideEntity(
        response: response,
        success: success,
        message: message,
        data: data!.map((e) => e.toEntity()).toList(),
      );

  @override
  // TODO: implement props
  List<Object?> get props => [response, success, message, data];
}

class Datum extends Equatable {
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

  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        gender: json["gender"],
        religion: json["religion"],
        country: json["country"],
        birthdate: json["birthdate"] == null
            ? null
            : DateTime.parse(json["birthdate"]),
        phone: json["phone"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  DatumEntity toEntity() => DatumEntity(
        id: id,
        name: name,
        image: image,
        gender: gender,
        religion: religion,
        country: country,
        birthdate: birthdate,
        phone: phone,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

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
