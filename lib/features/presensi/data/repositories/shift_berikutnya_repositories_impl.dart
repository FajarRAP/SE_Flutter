import 'package:dartz/dartz.dart';
import 'package:http/http.dart';


import '../../domain/repositories/shift_berikutnya_repositories.dart';
import '../data_sources/remote.dart';
import '../models/shift_berikutnya_model.dart';

class ShiftBerikutnyaRepositoriesImpl implements ShiftBerikutnyaRepositories {
  final PresensiService presensiService;

  ShiftBerikutnyaRepositoriesImpl({required this.presensiService});

  @override
  Future<Either<Failure, ShiftBerikutnyaModel>> getShiftBerikutnyas() async {
    try {
      final Response response = await presensiService.getShiftBerikutnyas();
      if(response.statusCode == 200){
        return Right(shiftBerikutnyaModelFromJson(response.body));
      }else{
        return Left(Failure(message: 'Ada Sesuatu Yang Salah'));
      }
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}