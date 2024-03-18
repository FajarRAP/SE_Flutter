import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';

abstract class AgendaRepositories<T> {
  Future<Either<Failure, T>> getAgendas(
    final String key,
    final String bulan,
    final bool isBerjalan,
  );
  Future<Either<Failure, T>> getDetailAgenda();
}
