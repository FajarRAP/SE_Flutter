import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';

abstract class DetailPresensiHariIniRepositories<T>{
  Future<Either<Failure,T>> getDetailPresensiHariIni();
}