

import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
    final int? response;
    final bool? success;
    final String? message;
    final DataEntity? data;

    ProfileEntity({
        this.response,
        this.success,
        this.message,
        this.data,
    });
    
      @override
      // TODO: implement props
      List<Object?> get props => [response, success, message, data];
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
