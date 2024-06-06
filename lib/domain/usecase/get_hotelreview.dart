import 'package:dartz/dartz.dart';
import 'package:simalungun_tourism/domain/entity/hotel_review_entity.dart';
import 'package:simalungun_tourism/domain/repositories/repository_domain.dart';

class GetHotelReview {
  RepositoryDomain repositoryDomain;

  GetHotelReview({required this.repositoryDomain});
    Future<Either<String, HotelReviewEntity>> call(int id) async{
    return await repositoryDomain.FetchHotelReview(id);
    }

}