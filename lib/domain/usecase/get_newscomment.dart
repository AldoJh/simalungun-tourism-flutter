import 'package:dartz/dartz.dart';
import 'package:simalungun_tourism/domain/entity/news_comment_entity.dart';
import 'package:simalungun_tourism/domain/repositories/repository_domain.dart';

class GetNewsComment {
  RepositoryDomain repositoryDomain;
  GetNewsComment({required this.repositoryDomain});

  Future<Either<String, NewsCommentEntity>> call(int id, String comment) async {
    return repositoryDomain.PostNewsComment(id, comment);
  }
}
