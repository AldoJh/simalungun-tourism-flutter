import 'package:dartz/dartz.dart';
import 'package:simalungun_tourism/domain/entity/profile_entity.dart';
import 'package:simalungun_tourism/domain/repositories/repository_domain.dart';

class GetUpdateProfilePassword {
  RepositoryDomain repositoryDomain;
  GetUpdateProfilePassword({required this.repositoryDomain});

    Future<Either<String, ProfileEntity>> call(String newPassword) async{
    return await repositoryDomain.updateProfilePassword(newPassword);
    }

}