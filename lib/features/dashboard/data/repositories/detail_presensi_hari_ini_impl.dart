import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:konsumsi_api_agenda/features/dashboard/data/models/detail_presensi.dart';

import '../../../../core/failure.dart';
import '../../domain/repositories/detail_presensi_repositories.dart';
import '../data_sources/remote.dart';

class DetailPresensiHariIniImpl implements DetailPresensiHariIniRepositories{
  final DetailPresensiHariIniService detailPresensiService;

  DetailPresensiHariIniImpl({required this.detailPresensiService});

  @override
  Future<Either<Failure, DetailPresensiHariIniModel>> getDetailPresensiHariIni() async {
    try {
      final Response response = await detailPresensiService.getDetailPresensiToday();
      if (response.statusCode == 200) {
        
        return Right(detailPresensiHariIniModelFromJson(response.body));
      } else {
        return Left(Failure(message: 'Ada Sesuatu Yang Salah'));
      }
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}