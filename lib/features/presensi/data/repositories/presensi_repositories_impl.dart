import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

import 'package:konsumsi_api_agenda/core/failure.dart';

import '../../domain/repositories/presensi_repositories.dart';
import '../data_sources/remote.dart';
import '../models/presensi.dart';
import '../models/presensi_detil_model.dart';
import '../models/rekap_presensi.dart';
import '../models/today_presensi.dart';

class PresensiRepositoriesImpl implements PresensiRepositories {
  final PresensiService presensiService;

  PresensiRepositoriesImpl({required this.presensiService});
  @override
  Future<Either<Failure, RekapPresensiModel>> getRekapPresensi() async {
    try {
      final Response response = await presensiService.getRekapPresensi();
      print(response.body);
      if (response.statusCode == 200) {
        return Right(rekapPresensiFromJson(response.body));
      } else {
        return Left(Failure(message: 'Ada Sesuatu Yang Salah'));
      }
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TodayPresensiModel>> getTodayPresensi() async {
    try {
      final Response response = await presensiService.getTodayPresensi();
      print(response.body);
      if (response.statusCode == 200) {
        return Right(todayPresensiFromJson(response.body));
      } else {
        return Left(Failure(message: 'Ada Sesuatu Yang Salah'));
      }
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, PresensiModel>> getDaftarPresensi() async {
    try {
      final Response response = await presensiService.getDaftarPresensi();

      if (response.statusCode == 200) {
        return Right(presensiFromJson(response.body));
      } else {
        return Left(Failure(message: 'Ada Sesuatu Yang Salah'));
      }
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
  @override
  Future<Either<Failure, PresensiDetilModel>> getDetilPresensi() async {
    try {
      final Response response = await presensiService.getPresensiDetil();
      if(response.statusCode == 200){
        return Right(presensiDetilModelFromJson(response.body));
      }else{
        return Left(Failure(message: 'Ada Sesuatu Yang Salah'));
      }
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
