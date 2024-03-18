
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

import '../../../../core/failure.dart';
import '../../domain/repositories/gaji_repositories.dart';
import '../data_sources/remote.dart';
import '../models/detail_gaji_model.dart';
import '../models/gaji_model.dart';

class GajiRepositoriesImpl implements GajiRepositories {
  final GajiService gajiService;

  GajiRepositoriesImpl({required this.gajiService});

  @override
  Future<Either<Failure, GajiModel>> getGaji() async {
    try {
      final Response response = await gajiService.getGaji();
      if (response.statusCode == 200) {
        return Right(gajiFromJson(response.body));
      } else {
        return Left(Failure(message: 'Ada sesuatu yang salah'));
      }
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, DetailGajiModel>> getDetailGaji() async {
    try {
      final Response response = await gajiService.getDetailGaji();
      if (response.statusCode == 200) {
        return Right(detailGajiFromJson(response.body));
      } else {
        return Left(Failure(message: 'Ada sesuatu yang salah'));
      }
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
