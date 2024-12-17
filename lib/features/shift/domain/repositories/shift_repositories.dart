import 'package:dartz/dartz.dart';

import '../../utils/shift_failure.dart';



abstract class ShiftRepositories<T> {
  Future<Either<Failure, T>> getShifts();
}
