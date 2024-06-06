

import 'package:dartz/dartz.dart';
import 'package:simalungun_tourism/domain/entity/festival_detail_entity.dart';
import 'package:simalungun_tourism/domain/repositories/repository_domain.dart';

class GetFestivalDetail {

  RepositoryDomain repositoryDomain;
  GetFestivalDetail({required this.repositoryDomain});

  Future<Either<String, FestivalDetailEntity>> call(int id) async {
    return await repositoryDomain.getFestivalDetail(id);
  }
  
}