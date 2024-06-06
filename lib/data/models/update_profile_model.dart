
import 'package:equatable/equatable.dart';
import 'package:simalungun_tourism/domain/entity/update_profile_entity.dart';

class UpdateProfileModel extends Equatable {
    final int? response;
    final bool? success;
    final String? message;
    final Validation? validation;
    final Data? data;

    UpdateProfileModel({
        this.response,
        this.success,
        this.message,
        this.validation,
        this.data,
    });

    factory UpdateProfileModel.fromJson(Map<String, dynamic> json) => UpdateProfileModel(
        response: json["response"],
        success: json["success"],
        message: json["message"],
        validation: json["validation"] == null ? null : Validation.fromJson(json["validation"]),
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    UpdateProfileEntity toEntity() => UpdateProfileEntity(
        response: response,
        success: success,
        message: message,
        validation: validation?.toEntity(),
        data: data?.toEntity(),
    );
    
      @override
      // TODO: implement props
      List<Object?> get props => [response, success, message, validation, data];

}

class Data extends Equatable{
    final int? id;
    final String? name;
    final String? email;
    final String? phone;
    final String? photo;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    Data({
        this.id,
        this.name,
        this.email,
        this.phone,
        this.photo,
        this.createdAt,
        this.updatedAt,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        photo: json["photo"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    DataEntity toEntity() => DataEntity(
        id: id,
        name: name,
        email: email,
        phone: phone,
        photo: photo,
        createdAt: createdAt,
        updatedAt: updatedAt,
    );
    
      @override
      // TODO: implement props
      List<Object?> get props => [id, name, email, phone, photo, createdAt, updatedAt];

}

class Validation extends Equatable{
    final List<String>? name;
    final List<String>? email;
    final List<String>? phone;
    final List<String>? photo;

    Validation({
        this.name,
        this.email,
        this.phone,
        this.photo,
    });

    factory Validation.fromJson(Map<String, dynamic> json) => Validation(
        name: json["name"] == null ? [] : List<String>.from(json["name"]!.map((x) => x)),
        email: json["email"] == null ? [] : List<String>.from(json["email"]!.map((x) => x)),
        phone: json["phone"] == null ? [] : List<String>.from(json["phone"]!.map((x) => x)),
        photo: json["photo"] == null ? [] : List<String>.from(json["photo"]!.map((x) => x)),
    );

    ValidationEntity toEntity() => ValidationEntity(
        name: name,
        email: email,
        phone: phone,
        photo: photo,
    );
    
      @override
      // TODO: implement props
      List<Object?> get props => [name, email, phone, photo];
}
