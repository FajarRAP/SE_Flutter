import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

import 'package:konsumsi_api_agenda/core/failure.dart';

import '../../domain/repositories/agenda_repositories.dart';
import '../data_sources/remote.dart';
import '../models/agenda.dart';
import '../models/detail_agenda.dart';

class AgendaRepositoriesImpl implements AgendaRepositories {
  final AgendaService agendaService;

  AgendaRepositoriesImpl({required this.agendaService});

  @override
  Future<Either<Failure, AgendaModel>> getAgendas(
    final String key,
    final String bulan,
    final bool isBerjalan,
  ) async {
    try {
      final Response response =
          await agendaService.getAgendas(key, bulan, isBerjalan);
      if (response.statusCode == 200) {
        return Right(agendaFromJson(response.body));
      } else {
        return Left(Failure(message: 'Ada Sesuatu Yang Salah'));
      }
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, DetailAgendaModel>> getDetailAgenda() async {
    try {
      final Response response = await agendaService.getDetailAgenda();
      if (response.statusCode == 200) {
        return Right(detailAgendaFromJson(response.body));
      } else {
        return Left(Failure(message: 'Ada Sesuatu Yang Salah'));
      }
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
