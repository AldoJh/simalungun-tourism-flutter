import 'package:dartz/dartz.dart';
import 'package:simalungun_tourism/domain/entity/restaurant_entity.dart';
import 'package:simalungun_tourism/domain/repositories/repository_domain.dart';

class GetRestaurant {

  RepositoryDomain repositoryDomain;
  GetRestaurant({required this.repositoryDomain});

    Future<Either<String, RestaurantEntity>> call(String query, int page, int perPage) async{
      return await repositoryDomain.FetchRestaurant(query, page, perPage);
    }

  
}