import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

import 'package:konsumsi_api_agenda/core/failure.dart';

import '../../domain/repositories/shift_repositories.dart';
import '../data_sources/remote.dart';
import '../models/shift_model.dart';

class ShiftRepositoriesImpl implements ShiftRepositories {
  final ShiftService shiftService;

  ShiftRepositoriesImpl({required this.shiftService});
  @override
  Future<Either<Failure, ShiftModel>> getShifts() async {
    try {
      final Response response = await shiftService.getShifts();
      if (response.statusCode == 200) {
        return Right(shiftFromJson(response.body));
      } else {
        return Left(Failure(message: 'Ada Sesuatu Yang Salah'));
      }
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
