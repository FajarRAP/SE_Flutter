import 'package:dartz/dartz.dart';


abstract class PresensiRepositories<T> {
  Future<Either<Failure, T>> getRekapPresensi();
  Future<Either<Failure, T>> getTodayPresensi();
  Future<Either<Failure, T>> getDaftarPresensi();
  Future<Either<Failure,T>> getDetilPresensi();
}

//jika pada clean architecture, ini ditaruh pada folder core
class Failure {
  final String message;

  Failure({required this.message});
}
