import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

import '../../../../core/failure.dart';

import '../../domain/repositories/cuti_repositories.dart';
import '../data_sources/remote.dart';
import '../models/cuti.dart';
import '../models/rekap_cuti.dart';

class CutiRepositoriesImpl implements CutiRepositories {
  final CutiService cutiService;

  CutiRepositoriesImpl({required this.cutiService});
  @override
  Future<Either<Failure, CutiModel>> getCutis() async {
    try {
      final Response response = await cutiService.getCutis();
      if (response.statusCode == 200) {
        return Right(cutiFromJson(response.body));
      } else {
        return Left(Failure(message: 'Ada Sesuatu Yang Salah'));
      }
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, RekapCutiModel>> getRekapCuti() async {
    try {
      final Response response = await cutiService.getRekapCuti();
      if (response.statusCode == 200) {
        return Right(rekapCutiFromJson(response.body));
      } else {
        return Left(Failure(message: 'Ada Sesuatu Yang Salah'));
      }
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
