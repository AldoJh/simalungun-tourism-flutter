import 'package:dartz/dartz.dart';
import 'package:simalungun_tourism/domain/entity/tour_review_entity.dart';
import 'package:simalungun_tourism/domain/repositories/repository_domain.dart';

class GetTourReview {
  RepositoryDomain repositoryDomain;
  GetTourReview({required this.repositoryDomain});

    Future<Either<String, TourReviewEntity>> call(int id) async{
    return await repositoryDomain.FetchTourReview(id);
    }

}