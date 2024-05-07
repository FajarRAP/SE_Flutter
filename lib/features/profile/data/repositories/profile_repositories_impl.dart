import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

import 'package:konsumsi_api_agenda/core/failure.dart';

import '../../domain/repositories/profile_repositories.dart';
import '../data_sources/remote.dart';
import '../models/profile.dart';

class ProfileRepositoriesImpl implements ProfileRepositories {
  final ProfileService profileService;

  ProfileRepositoriesImpl({required this.profileService});

  @override
  Future<Either<Failure, ProfileModel>> getProfile() async {
    try {
      final Response response = await profileService.getProfile();
      if (response.statusCode == 200) {
        return Right(profileFromJson(response.body));
      } else {
        return Left(Failure(message: 'Ada Sesuatu Yang Salah'));
      }
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
