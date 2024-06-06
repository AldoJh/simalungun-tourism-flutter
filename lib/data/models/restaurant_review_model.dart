import 'package:equatable/equatable.dart';
import 'package:simalungun_tourism/domain/entity/restaurant_review_entity.dart';

class RestaurantReviewModel extends Equatable {
  final int? response;
  final bool? success;
  final String? message;
  final List<Datum>? data;

  RestaurantReviewModel({
    this.response,
    this.success,
    this.message,
    this.data,
  });

  factory RestaurantReviewModel.fromJson(Map<String, dynamic> json) =>
      RestaurantReviewModel(
        response: json["response"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  RestaurantReviewEntity toEntity() => RestaurantReviewEntity(
        response: response,
        success: success,
        message: message,
        data: data?.map((e) => e.toEntity()).toList(),
      );

  @override
  // TODO: implement props
  List<Object?> get props => [response, success, message, data];
}

class Datum extends Equatable {
  final int? id;
  final int? rate;
  final String? comment;
  final User? user;

  Datum({
    this.id,
    this.rate,
    this.comment,
    this.user,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        rate: json["rate"],
        comment: json["comment"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  DatumEntity toEntity() => DatumEntity(
        id: id,
        rate: rate,
        comment: comment,
        user: user?.toEntity(),
      );

  @override
  // TODO: implement props
  List<Object?> get props => [id, rate, comment, user];
}

class User extends Equatable {
  final int? id;
  final String? name;
  final String? image;

  User({
    this.id,
    this.name,
    this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  UserEntity toEntity() => UserEntity(
        id: id,
        name: name,
        image: image,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, image];
}
