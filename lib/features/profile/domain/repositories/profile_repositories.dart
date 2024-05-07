import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';

abstract class ProfileRepositories<T> {
  Future<Either<Failure, T>> getProfile();
}