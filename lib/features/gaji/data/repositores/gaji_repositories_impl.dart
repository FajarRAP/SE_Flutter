import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

import 'package:konsumsi_api_agenda/core/failure.dart';
import 'package:konsumsi_api_agenda/features/gaji/data/models/detail_gaji_model.dart';

import '../../domain/repositories/gaji_repositories.dart';
import '../data_sources/remote.dart';
import '../models/gaji.dart';

class GajiRepositoriesImpl implements GajiRepositories {
  final GajiService gajiService;

  GajiRepositoriesImpl({required this.gajiService});
  @override
  Future<Either<Failure, GajiModel>> getGajis() async {
    try {
      final Response response = await gajiService.getGajis();
      if (response.statusCode == 200) {
        return Right(gajiFromJson(response.body));
      } else {
        return Left(Failure(message: 'Ada Sesuatu Yang Salah'));
      }
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, DetailGajiModel>> getDetailGaji() async {
    final Response response = await gajiService.getDetailGaji();
    try {
      if (response.statusCode == 200) {
        return Right(detailGajiFromJson(response.body));
      } else {
        return Left(Failure(message: 'Ada Sesuatu Yang Salah'));
      }
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
