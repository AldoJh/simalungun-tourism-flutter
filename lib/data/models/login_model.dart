// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:simalungun_tourism/domain/entity/login_entity.dart';

class LoginModel extends Equatable {
  int? response;
  bool? success;
  String? message;
  Validation? validation;
  LoginModelData? data;

  LoginModel({
    this.response,
    this.success,
    this.message,
    this.validation,
    this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        response: json["response"],
        success: json["success"],
        message: json["message"],
        validation: json["validation"] == null
            ? null
            : Validation.fromJson(json["validation"]),
        data: json["data"] == null
            ? null
            : json["data"] == []
                ? null
                : LoginModelData.fromJson(json["data"]),
      );

  LoginEntity toEntity() => LoginEntity(
        response: response,
        success: success,
        message: message,
        validation: validation?.toEntity(),
        data: data?.toEntityData(),
      );

  @override
  // TODO: implement props
  List<Object?> get props => [response, success, message, validation, data];
}

class LoginModelData extends Equatable {
  DataData? data;
  String? accessToken;
  String? tokenType;

  LoginModelData({
    this.data,
    this.accessToken,
    this.tokenType,
  });

  factory LoginModelData.fromJson(Map<String, dynamic> json) => LoginModelData(
        data: json["data"] == null ? null : DataData.fromJson(json["data"]),
        accessToken: json["access_token"],
        tokenType: json["token_type"],
      );

  LoginEntityData toEntityData() => LoginEntityData(
        data: data?.toEntityData(),
        accessToken: accessToken,
        tokenType: tokenType,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [data, accessToken, tokenType];
}

class DataData extends Equatable {
  int? id;
  String? name;
  String? email;
  String? phone;
  dynamic emailVerifiedAt;
  String? photo;
  String? role;
  int? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;

  DataData({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.emailVerifiedAt,
    this.photo,
    this.role,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        emailVerifiedAt: json["email_verified_at"],
        photo: json["photo"],
        role: json["role"],
        isActive: json["is_active"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  DataEntity toEntityData() => DataEntity(
        id: id,
        name: name,
        email: email,
        phone: phone,
        emailVerifiedAt: emailVerifiedAt,
        photo: photo,
        role: role,
        isActive: isActive,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        email,
        phone,
        emailVerifiedAt,
        photo,
        role,
        isActive,
        createdAt,
        updatedAt
      ];
}

class Validation extends Equatable {
  List<String>? email;
  List<String>? password;

  Validation({
    this.email,
    this.password,
  });

  factory Validation.fromJson(Map<String, dynamic> json) => Validation(
        email: json["email"] == null
            ? []
            : List<String>.from(json["email"]!.map((x) => x)),
        password: json["password"] == null
            ? []
            : List<String>.from(json["password"]!.map((x) => x)),
      );

  ValidationEntity toEntity() => ValidationEntity(
        email: email,
        password: password,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [email, password];
}
