import 'package:dartz/dartz.dart';
import 'package:simalungun_tourism/domain/entity/hotel_entity.dart';
import 'package:simalungun_tourism/domain/repositories/repository_domain.dart';

class GetHotel {

  RepositoryDomain repositoryDomain;
  GetHotel({required this.repositoryDomain});

    Future<Either<String, HotelEntity>> call(String query, int page, int perPage) async{
      return await repositoryDomain.FetchHotel(query, page, perPage);
    }
  
}