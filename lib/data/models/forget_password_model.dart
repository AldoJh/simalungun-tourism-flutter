import 'package:equatable/equatable.dart';
import 'package:simalungun_tourism/domain/entity/forget_password_entity.dart';

class ForgetPasswordModel extends Equatable {
  final int? response;
  final bool? success;
  final String? message;
  final Validation? validation;
  final List<dynamic>? data;

  ForgetPasswordModel({
    this.response,
    this.success,
    this.message,
    this.validation,
    this.data,
  });

  factory ForgetPasswordModel.fromJson(Map<String, dynamic> json) =>
      ForgetPasswordModel(
        response: json["response"],
        success: json["success"],
        message: json["message"],
        validation: json["validation"] == null
            ? null
            : Validation.fromJson(json["validation"]),
        data: json["data"] == null
            ? []
            : List<dynamic>.from(json["data"]!.map((x) => x)),
      );

  ForgetPasswordEntity toEntity() => ForgetPasswordEntity(
        response: response,
        success: success,
        message: message,
        validation: validation?.toEntity(),
        data: data,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [response, success, message, validation, data];
}

class Validation extends Equatable {
  final List<String>? email;

  Validation({
    this.email,
  });
  factory Validation.fromJson(Map<String, dynamic> json) => Validation(
        email: json["email"] == null
            ? []
            : List<String>.from(json["email"]!.map((x) => x)),
      );

  ValidationEntity toEntity() => ValidationEntity(
        email: email,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [email];
}
