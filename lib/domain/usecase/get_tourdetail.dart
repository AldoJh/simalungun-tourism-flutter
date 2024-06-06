import 'package:dartz/dartz.dart';
import 'package:simalungun_tourism/domain/entity/tour_detail_entity.dart';
import 'package:simalungun_tourism/domain/repositories/repository_domain.dart';

class GetTourDetail {
  RepositoryDomain repositoryDomain;
  GetTourDetail({required this.repositoryDomain});

    Future<Either<String, TourDetailEntity>> call(int id) async{
      return await repositoryDomain.FetchTourDetail(id);
    }

}