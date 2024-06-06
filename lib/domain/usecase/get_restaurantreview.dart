import 'package:dartz/dartz.dart';
import 'package:simalungun_tourism/domain/entity/restaurant_review_entity.dart';
import 'package:simalungun_tourism/domain/repositories/repository_domain.dart';

class GetRestaurantReview {
  
  RepositoryDomain repositoryDomain;
  GetRestaurantReview({required this.repositoryDomain});

   Future<Either<String, RestaurantReviewEntity>> call(int id) async{
    return await repositoryDomain.FetchRestaurantReview(id);
   }

}