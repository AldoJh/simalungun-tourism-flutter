
import 'package:equatable/equatable.dart';

class UpdateProfileEntity extends Equatable {
    final int? response;
    final bool? success;
    final String? message;
    final ValidationEntity? validation;
    final DataEntity? data;

    UpdateProfileEntity({
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

class DataEntity extends Equatable{
    final int? id;
    final String? name;
    final String? email;
    final String? phone;
    final String? photo;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    DataEntity({
        this.id,
        this.name,
        this.email,
        this.phone,
        this.photo,
        this.createdAt,
        this.updatedAt,
    });
    
      @override
      // TODO: implement props
      List<Object?> get props => [id, name, email, phone, photo, createdAt, updatedAt];

}

class ValidationEntity extends Equatable{
    final List<String>? name;
    final List<String>? email;
    final List<String>? phone;
    final List<String>? photo;

    ValidationEntity({
        this.name,
        this.email,
        this.phone,
        this.photo,
    });
    
      @override
      // TODO: implement props
      List<Object?> get props => [name, email, phone, photo];
}
