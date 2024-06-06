import 'package:dartz/dartz.dart';
import 'package:simalungun_tourism/domain/entity/restaurant_detail_entity.dart';
import 'package:simalungun_tourism/domain/repositories/repository_domain.dart';

class GetRestaurantDetail {
  RepositoryDomain repositoryDomain;
  GetRestaurantDetail({required this.repositoryDomain});

 Future<Either<String, RestaurantDetailEntity>> call(int id) async{
    return await repositoryDomain.FetchRestaurantDetail(id);
 }

}