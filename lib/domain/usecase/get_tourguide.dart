import 'package:dartz/dartz.dart';
import 'package:simalungun_tourism/domain/entity/tour_guider_entity.dart';
import 'package:simalungun_tourism/domain/repositories/repository_domain.dart';

class GetTourGuide {
  RepositoryDomain repositoryDomain;
  GetTourGuide({required this.repositoryDomain});

    Future<Either<String, TourGuideEntity>> call(int id) async{
      return await repositoryDomain.FetchTourGuide(id);
    }
}