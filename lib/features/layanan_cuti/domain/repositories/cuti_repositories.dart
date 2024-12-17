import 'package:dartz/dartz.dart';

import '../../utils/cuti_failure.dart';



abstract class CutiRepositories<T> {
  Future<Either<Failure, T>> getCutis();
  Future<Either<Failure, T>> getRekapCuti();
}