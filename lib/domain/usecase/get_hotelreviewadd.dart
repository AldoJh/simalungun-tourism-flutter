import 'package:dartz/dartz.dart';
import 'package:simalungun_tourism/domain/entity/review_entity.dart';
import 'package:simalungun_tourism/domain/repositories/repository_domain.dart';

class GetHotelReviewAdd {
  RepositoryDomain repositoryDomain;
  GetHotelReviewAdd({required this.repositoryDomain});

    Future<Either<String, ReviewEntity>> call(int id, int rate, String comment) async{
      return await repositoryDomain.PostHotelReview(id, rate, comment);
    }

}