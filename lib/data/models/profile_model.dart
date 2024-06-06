import 'package:equatable/equatable.dart';
import 'package:simalungun_tourism/domain/entity/profile_entity.dart';

class ProfileModel extends Equatable {
  final int? response;
  final bool? success;
  final String? message;
  final Data? data;

  ProfileModel({
    this.response,
    this.success,
    this.message,
    this.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        response: json["response"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  ProfileEntity toEntity() => ProfileEntity(
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
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? photo;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Data({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.photo,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        photo: json["photo"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  DataEntity toEntity() => DataEntity(
        id: id,
        name: name,
        email: email,
        phone: phone,
        photo: photo,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, name, email, phone, photo, createdAt, updatedAt];
}
