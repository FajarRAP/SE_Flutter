import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

import 'package:konsumsi_api_agenda/core/failure.dart';

import '../../domain/repositories/tunjangan_repositories.dart';
import '../data_sources/remote.dart';
import '../models/detail_tunjangan_model.dart';
import '../models/tunjangan_model.dart';

class TunjanganRepositoriesImpl implements TunjanganRepositories {
  final TunjanganService tunjanganService;

  TunjanganRepositoriesImpl({required this.tunjanganService});
  @override
  Future<Either<Failure, TunjanganModel>> getTunjangans() async {
    try {
      final Response response = await tunjanganService.getTunjangans();
      if (response.statusCode == 200) {
        return Right(tunjanganFromJson(response.body));
      } else {
        return Left(Failure(message: 'Ada Sesuatu Yang Salah'));
      }
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, DetailTunjanganModel>> getDetailTunjangan() async {
    try {
      final Response response = await tunjanganService.getDetailTunjangan();
      if (response.statusCode == 200) {
        return Right(detailTunjanganFromJson(response.body));
      } else {
        return Left(Failure(message: 'Ada Sesuatu Yang Salah'));
      }
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
