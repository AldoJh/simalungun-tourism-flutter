import 'package:dartz/dartz.dart';
import 'package:simalungun_tourism/domain/entity/forget_password_entity.dart';
import 'package:simalungun_tourism/domain/repositories/repository_domain.dart';

class GetForgetPassword {
  RepositoryDomain repositoryDomain;
  GetForgetPassword({required this.repositoryDomain});
  Future<Either<String, ForgetPasswordEntity>> call(String email) async {
    return repositoryDomain.PostForgetPassword(email);
  }
}
