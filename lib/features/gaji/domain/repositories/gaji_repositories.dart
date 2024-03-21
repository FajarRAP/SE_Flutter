import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';

abstract class GajiRepositories<T> {
  Future<Either<Failure, T>> getGajis();
  Future<Either<Failure, T>> getDetailGaji();
}
