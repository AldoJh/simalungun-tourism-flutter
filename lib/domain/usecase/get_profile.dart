import 'package:dartz/dartz.dart';
import 'package:simalungun_tourism/domain/entity/profile_entity.dart';
import 'package:simalungun_tourism/domain/repositories/repository_domain.dart';

class GetProfile {

  RepositoryDomain repositoryDomain;
  GetProfile({required this.repositoryDomain});

    Future<Either<String, ProfileEntity>> call()async{
      return await repositoryDomain.fetchProfile();
    }

  
}