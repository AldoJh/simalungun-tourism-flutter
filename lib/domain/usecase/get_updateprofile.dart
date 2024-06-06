import 'package:dartz/dartz.dart';
import 'package:simalungun_tourism/domain/entity/profile_entity.dart';
import 'package:simalungun_tourism/domain/repositories/repository_domain.dart';

class GetUpdateProfile {
  RepositoryDomain repositoryDomain;
  GetUpdateProfile({required this.repositoryDomain});

    Future<Either<String, ProfileEntity>> call(String name, String email, String phone)async{
    return await repositoryDomain.updateProfile(name, email, phone);
    }

  
}