import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';

abstract class AuthRepositories<T> {
  Future<Either<Failure, T>> authLogin(Map<String, String> body);
}