import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:simalungun_tourism/domain/entity/register_entity.dart';
import 'package:simalungun_tourism/domain/repositories/repository_domain.dart';

class GetRegister {
  RepositoryDomain repositoryDomain;
  GetRegister({required this.repositoryDomain});

  Future<Either<String, RegisterEntity>> call(
      String name, String email, String phone, String password) {
    log('GetRegister');
    return repositoryDomain.Register(name, email, phone, password );
  }
}
