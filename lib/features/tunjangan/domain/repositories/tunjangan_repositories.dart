import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';

abstract class TunjanganRepositories<T> {
  Future<Either<Failure, T>> getTunjangans(
    String date
  );
  Future<Either<Failure, T>> getDetailTunjangan();
}
