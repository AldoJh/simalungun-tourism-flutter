import 'package:equatable/equatable.dart';

class ReviewEntity extends Equatable {
  final int? response;
  final bool? success;
  final String? message;
  final ValidationEntity? validation;
  final dynamic data;

  ReviewEntity({
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

class ValidationEntity extends Equatable {
  final List<String>? rate;
  final List<String>? comment;

  ValidationEntity({
    this.rate,
    this.comment,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [rate, comment];
}
