import 'package:equatable/equatable.dart';
import 'package:simalungun_tourism/domain/entity/restaurant_menu_entity.dart';

class RestaurantMenuModel extends Equatable {
  final int? response;
  final bool? success;
  final String? message;
  final List<Datum>? data;

  RestaurantMenuModel({
    this.response,
    this.success,
    this.message,
    this.data,
  });

  factory RestaurantMenuModel.fromJson(Map<String, dynamic> json) =>
      RestaurantMenuModel(
        response: json["response"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  RestaurantMenuEntity toEntity() => RestaurantMenuEntity(
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
  final String? description;
  final String? category;
  final String? price;
  final String? image;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Datum({
    this.id,
    this.name,
    this.description,
    this.category,
    this.price,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        category: json["category"],
        price: json["price"],
        image: json["image"],
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
        description: description,
        category: category,
        price: price,
        image: image,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, name, description, category, price, image, createdAt, updatedAt];
}
