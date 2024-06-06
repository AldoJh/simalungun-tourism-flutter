// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class RegisterEntity extends Equatable {
  int? response;
  bool? success;
  String? message;
  ValidationEntity? validation;
  RegisterEntityData? data;

  RegisterEntity({
    this.response,
    this.success,
    this.message,
    this.validation,
    this.data,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [response, success, message, validation, data];
}

class RegisterEntityData extends Equatable {
  DataEntity? data;
  String? accessToken;
  String? tokenType;

  RegisterEntityData({
    this.data,
    this.accessToken,
    this.tokenType,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [data, accessToken, tokenType];
}

class DataEntity extends Equatable {
  String? name;
  String? email;
  bool? isActive;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  DataEntity({
    this.name,
    this.email,
    this.isActive,
    this.updatedAt,
    this.createdAt,
    this.id,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [name, email, isActive, updatedAt, createdAt, id];
}

class ValidationEntity extends Equatable {
  List<dynamic>? name;
  List<dynamic>? email;
  List<dynamic>? password;
  List<dynamic>? phone;

  ValidationEntity({
    this.name,
    this.email,
    this.password,
    this.phone,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [name, email, password, phone];
}
