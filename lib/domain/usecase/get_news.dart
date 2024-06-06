import 'package:dartz/dartz.dart';
import 'package:simalungun_tourism/domain/entity/news_entity.dart';
import 'package:simalungun_tourism/domain/repositories/repository_domain.dart';

class GetNews {
  RepositoryDomain repositoryDomain;
  GetNews(this.repositoryDomain);

  Future<Either<String, NewsEntity>> call(String query, int page, int perPage) async {
    return await repositoryDomain.getNews(query, page, perPage);
  }
}
