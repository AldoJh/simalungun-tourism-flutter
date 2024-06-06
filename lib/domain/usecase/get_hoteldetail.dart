import 'package:dartz/dartz.dart';
import 'package:simalungun_tourism/domain/entity/hotel_detail_entity.dart';
import 'package:simalungun_tourism/domain/repositories/repository_domain.dart';

class GetHotelDetail {
  RepositoryDomain repositoryDomain;
  GetHotelDetail({required this.repositoryDomain});

    Future<Either<String, HotelDetailEntity>> call(int id) async{
      return await repositoryDomain.FetchHotelDetail(id);
    }

}