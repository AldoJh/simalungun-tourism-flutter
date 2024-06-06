import 'package:dartz/dartz.dart';
import 'package:simalungun_tourism/domain/entity/tour_entity.dart';
import 'package:simalungun_tourism/domain/repositories/repository_domain.dart';

class GetTour {
  RepositoryDomain repositoryDomain;
  GetTour({required this.repositoryDomain});

  Future<Either<String, TourEntity>> call(String query, int page, int perPage) async {
    return await repositoryDomain.FetchTour(query, page, perPage);
  }
}
