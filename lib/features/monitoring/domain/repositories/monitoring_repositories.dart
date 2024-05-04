import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';

abstract class MonitoringRepositories<T> {
  Future<Either<Failure, T>> getMonitorings();
  Future<Either<Failure, T>> getRekapMonitoring();
  Future<Either<Failure, T>> getDetailMonitoring();
  Future<Either<Failure,T>> getRekapBulanan();
  Future<Either<Failure,T>> getDaftarPresensis();
}
