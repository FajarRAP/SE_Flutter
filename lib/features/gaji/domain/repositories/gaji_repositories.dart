import "package:dartz/dartz.dart";

import "../../../../core/failure.dart";

abstract class GajiRepositories<T> {
  Future<Either<Failure,T>> getGaji();
  Future<Either<Failure,T>> getDetailGaji();
}