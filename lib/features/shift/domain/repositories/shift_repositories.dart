import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';

abstract class ShiftRepositories<T> {
  Future<Either<Failure, T>> getShifts();
}
