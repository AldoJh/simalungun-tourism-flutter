import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:simalungun_tourism/domain/entity/profile_entity.dart';
import 'package:simalungun_tourism/domain/repositories/repository_domain.dart';

class GetUpdateProfilePicture {
  RepositoryDomain repositoryDomain;
  GetUpdateProfilePicture({required this.repositoryDomain});
  Future<Either<String, ProfileEntity>> call(File image) async {
    return await repositoryDomain.updateProfilePicture(image);
  }
}
