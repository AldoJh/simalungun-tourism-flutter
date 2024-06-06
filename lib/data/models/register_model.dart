// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:simalungun_tourism/domain/entity/register_entity.dart';

class RegisterModel extends Equatable {
  int? response;
  bool? success;
  String? message;
  Validation? validation;
  RegisterModelData? data;

  RegisterModel({
    this.response,
    this.success,
    this.message,
    this.validation,
    this.data,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        response: json["response"],
        success: json["success"],
        message: json["message"],
        validation: json["validation"] == null
            ? null
            : Validation.fromJson(json["validation"]),
        data: json["data"] == null
            ? null
            : RegisterModelData.fromJson(json["data"]),
      );

  RegisterEntity toEntity() => RegisterEntity(
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

class RegisterModelData extends Equatable {
  DataData? data;
  String? accessToken;
  String? tokenType;

  RegisterModelData({
    this.data,
    this.accessToken,
    this.tokenType,
  });

  factory RegisterModelData.fromJson(Map<String, dynamic> json) =>
      RegisterModelData(
        data: json["data"] == null ? null : DataData.fromJson(json["data"]),
        accessToken: json["access_token"],
        tokenType: json["token_type"],
      );

  RegisterEntityData toEntityData() => RegisterEntityData(
        data: data?.toEntity(),
        accessToken: accessToken,
        tokenType: tokenType,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [data, accessToken, tokenType];
}

class DataData extends Equatable {
  String? name;
  String? email;
  bool? isActive;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  DataData({
    this.name,
    this.email,
    this.isActive,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
        name: json["name"],
        email: json["email"],
        isActive: json["is_active"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  DataEntity toEntity() => DataEntity(
        name: name,
        email: email,
        isActive: isActive,
        updatedAt: updatedAt,
        createdAt: createdAt,
        id: id,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [name, email, isActive, updatedAt, createdAt, id];
}

class Validation extends Equatable {
  List<dynamic>? name;
  List<dynamic>? email;
  List<dynamic>? password;
  List<dynamic>? phone;

  Validation({
    this.name,
    this.email,
    this.password,
    this.phone,
  });

  factory Validation.fromJson(Map<String, dynamic> json) => Validation(
        name: json["name"] == null
            ? []
            : List<dynamic>.from(json["name"]?.map((x) => x)),
        email: json["email"] == null
            ? []
            : List<dynamic>.from(json["email"]?.map((x) => x)),
        password: json["password"] == null
            ? []
            : List<dynamic>.from(json["password"]?.map((x) => x)),
        phone: json["phone"] == null
            ? []
            : List<dynamic>.from(json["phone"]?.map((x) => x)),
      );

  ValidationEntity toEntity() => ValidationEntity(
        name: name,
        email: email,
        password: password,
        phone: phone,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [name, email, password, phone];
}
