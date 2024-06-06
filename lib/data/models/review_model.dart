import 'package:equatable/equatable.dart';
import 'package:simalungun_tourism/domain/entity/review_entity.dart';

class ReviewModel extends Equatable {
  final int? response;
  final bool? success;
  final String? message;
  final Validation? validation;
  final dynamic data;

  ReviewModel({
    this.response,
    this.success,
    this.message,
    this.validation,
    this.data,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        response: json["response"],
        success: json["success"],
        message: json["message"],
        validation: json["validation"] == null
            ? null
            : Validation.fromJson(json["validation"]),
        data: json["data"],
      );

  ReviewEntity toEntity() => ReviewEntity(
        response: response,
        success: success,
        message: message,
        validation: validation!.toEntity(),
        data: data,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [response, success, message, validation, data];
}

class Validation extends Equatable {
  final List<String>? rate;
  final List<String>? comment;

  Validation({
    this.rate,
    this.comment,
  });

  factory Validation.fromJson(Map<String, dynamic> json) => Validation(
        rate: json["rate"] == null
            ? []
            : List<String>.from(json["rate"]!.map((x) => x)),
        comment: json["comment"] == null
            ? []
            : List<String>.from(json["comment"]!.map((x) => x)),
      );

  ValidationEntity toEntity() => ValidationEntity(
        rate: rate,
        comment: comment,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [rate, comment];
}
