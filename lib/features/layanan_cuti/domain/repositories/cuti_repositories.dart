import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';

abstract class CutiRepositories<T> {
  Future<Either<Failure, T>> getCutis();
  Future<Either<Failure, T>> getRekapCuti();
}