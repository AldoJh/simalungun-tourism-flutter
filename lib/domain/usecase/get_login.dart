import 'package:dartz/dartz.dart';
import 'package:simalungun_tourism/domain/entity/login_entity.dart';
import 'package:simalungun_tourism/domain/repositories/repository_domain.dart';

class GetLogin {
  final RepositoryDomain repositoryDomain;

  GetLogin({required this.repositoryDomain});

  Future<Either<String, LoginEntity>> call(
      String email, String password) async {
    return await repositoryDomain.Login(email, password);
  }
}
