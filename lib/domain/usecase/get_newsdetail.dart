import 'package:dartz/dartz.dart';
import 'package:simalungun_tourism/domain/entity/news_detail_entity.dart';
import 'package:simalungun_tourism/domain/repositories/repository_domain.dart';

class GetNewsDetail {
  RepositoryDomain repositoryDomain;
  GetNewsDetail({required this.repositoryDomain});

  Future<Either<String, NewsDetailEntity>> call(int id) async {
    return await repositoryDomain.getNewsDetail(id);
  }
}
