import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';

abstract class PresensiRepositories<T> {
  Future<Either<Failure, T>> getRekapPresensi();
  Future<Either<Failure, T>> getTodayPresensi();
  Future<Either<Failure, T>> getDaftarPresensi();
  Future<Either<Failure,T>> getDetilPresensi();
}
