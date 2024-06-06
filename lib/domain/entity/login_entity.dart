// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
    int? response;
    bool? success;
    String? message;
    ValidationEntity? validation;
    LoginEntityData? data;

    LoginEntity({
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

class LoginEntityData extends Equatable{
    DataEntity? data;
    String? accessToken;
    String? tokenType;

    LoginEntityData({
        this.data,
        this.accessToken,
        this.tokenType,
    });
      @override
      // TODO: implement props
      List<Object?> get props => [data, accessToken, tokenType];
}

class DataEntity extends Equatable {
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

    DataEntity({
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

      @override
      // TODO: implement props
      List<Object?> get props => [id, name, email, phone, emailVerifiedAt, photo, role, isActive, createdAt, updatedAt];
}

class ValidationEntity extends Equatable{
    List<String>? email;
    List<String>? password;

    ValidationEntity({
        this.email,
        this.password,
    });

      @override
      // TODO: implement props
      List<Object?> get props => [email, password];
}
