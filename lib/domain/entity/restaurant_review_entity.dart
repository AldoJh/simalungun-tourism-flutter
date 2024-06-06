
import 'package:equatable/equatable.dart';

class RestaurantReviewEntity extends Equatable {
    final int? response;
    final bool? success;
    final String? message;
    final List<DatumEntity>? data;

    RestaurantReviewEntity({
        this.response,
        this.success,
        this.message,
        this.data,
    });

    
      @override
      // TODO: implement props
      List<Object?> get props => [response, success, message, data];
}

class DatumEntity extends Equatable{
    final int? id;
    final int? rate;
    final String? comment;
    final UserEntity? user;

    DatumEntity({
        this.id,
        this.rate,
        this.comment,
        this.user,
    });

      @override
      // TODO: implement props
      List<Object?> get props => [id, rate, comment, user];
}

class UserEntity extends Equatable{
    final int? id;
    final String? name;
    final String? image;

    UserEntity({
        this.id,
        this.name,
        this.image,
    });

    
      @override
      // TODO: implement props
      List<Object?> get props => [id, name, image];
}
