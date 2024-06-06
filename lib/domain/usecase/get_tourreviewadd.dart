import 'package:dartz/dartz.dart';
import 'package:simalungun_tourism/domain/entity/review_entity.dart';
import 'package:simalungun_tourism/domain/repositories/repository_domain.dart';

class GetTourReviewAdd {
  RepositoryDomain repositoryDomain;
  GetTourReviewAdd({required this.repositoryDomain});

  Future<Either<String, ReviewEntity>> call(
      int id, int rate, String comment) async {
    return await repositoryDomain.PostTourReview(id, rate, comment);
  }
}
