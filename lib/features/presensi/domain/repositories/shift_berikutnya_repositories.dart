import 'package:dartz/dartz.dart';

abstract class ShiftBerikutnyaRepositories<T> {
  Future<Either<Failure, T>> getShiftBerikutnyas();
}

//jika pada clean architecture, ini ditaruh pada folder core
class Failure {
  final String message;

  Failure({required this.message});
}
