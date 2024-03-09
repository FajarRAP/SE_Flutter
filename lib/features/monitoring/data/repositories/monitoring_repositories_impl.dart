import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

import 'package:konsumsi_api_agenda/core/failure.dart';
import 'package:konsumsi_api_agenda/features/monitoring/data/models/detail_monitoring.dart';

import '../../domain/repositories/monitoring_repositories.dart';
import '../data_sources/remote.dart';
import '../models/rekap_monitoring.dart';
import '../models/monitoring.dart';

class MonitoringRepositoriesImpl implements MonitoringRepositories {
  final MonitoringService monitoringService;

  MonitoringRepositoriesImpl({required this.monitoringService});
  @override
  Future<Either<Failure, MonitoringModel>> getMonitorings() async {
    try {
      final Response response = await monitoringService.getMonitorings();
      if (response.statusCode == 200) {
        return Right(monitoringFromJson(response.body));
      } else {
        return Left(Failure(message: 'Ada Sesuatu Yang Salah'));
      }
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, RekapMonitoringModel>> getRekapMonitoring() async {
    try {
      final Response response = await monitoringService.getRekapMonitoring();
      if (response.statusCode == 200) {
        return Right(rekapMonitoringFromJson(response.body));
      } else {
        return Left(Failure(message: 'Ada Sesuatu Yang Salah'));
      }
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> getDetailMonitoring() async {
    try {
      final Response response = await monitoringService.getDetailMonitoring();
      if (response.statusCode == 200) {
        return Right(detailMonitoringFromJson(response.body));
      } else {
        return Left(Failure(message: 'Ada Sesuatu Yang Salah'));
      }
    } catch (e) {
      return Right(Failure(message: e.toString()));
    }
  }
}
