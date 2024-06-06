import 'package:dartz/dartz.dart';
import 'package:simalungun_tourism/domain/entity/restaurant_menu_entity.dart';
import 'package:simalungun_tourism/domain/repositories/repository_domain.dart';

class GetRestaurantMenu {
  RepositoryDomain repositoryDomain;
  GetRestaurantMenu({required this.repositoryDomain});

    Future<Either<String, RestaurantMenuEntity>> call(int id) async{
      return await repositoryDomain.FetchRestaurantMenu(id);
    }

}