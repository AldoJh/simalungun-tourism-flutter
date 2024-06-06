
import 'package:dartz/dartz.dart';
import 'package:simalungun_tourism/domain/entity/festival_entity.dart';
import 'package:simalungun_tourism/domain/repositories/repository_domain.dart';

class GetFestival {

  RepositoryDomain repositoryDomain;
  GetFestival({required this.repositoryDomain});

  Future<Either<String, FestivalEntity>> call(String query, int page, int perPage) async {
    return await repositoryDomain.getFestival(query, page, perPage);
  }
  
}