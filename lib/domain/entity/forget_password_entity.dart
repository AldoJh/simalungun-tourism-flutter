

import 'package:equatable/equatable.dart';

class ForgetPasswordEntity extends Equatable{
    final int? response;
    final bool? success;
    final String? message;
    final ValidationEntity? validation;
    final List<dynamic>? data;

    ForgetPasswordEntity({
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

class ValidationEntity extends Equatable{
    final List<String>? email;

    ValidationEntity({
        this.email,
    });
    
      @override
      // TODO: implement props
      List<Object?> get props => [email];
}
