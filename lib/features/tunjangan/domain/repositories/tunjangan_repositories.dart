import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';

abstract class TunjanganRepositories<T> {
  Future<Either<Failure, T>> getTunjangan(
    final String date
  );

  Future<Either<Failure,T>> getDetailTunjangan();
}