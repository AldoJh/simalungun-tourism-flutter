import 'package:equatable/equatable.dart';

class RestaurantMenuEntity extends Equatable {
  final int? response;
  final bool? success;
  final String? message;
  final List<DatumEntity>? data;

  RestaurantMenuEntity({
    this.response,
    this.success,
    this.message,
    this.data,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [response, success, message, data];
}

class DatumEntity extends Equatable {
  final int? id;
  final String? name;
  final String? description;
  final String? category;
  final String? price;
  final String? image;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  DatumEntity({
    this.id,
    this.name,
    this.description,
    this.category,
    this.price,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, name, description, category, price, image, createdAt, updatedAt];
}
