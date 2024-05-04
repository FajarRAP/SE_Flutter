import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';

abstract class ShiftBerikutnyaRepositories<T> {
  Future<Either<Failure, T>> getShiftBerikutnyas();
}