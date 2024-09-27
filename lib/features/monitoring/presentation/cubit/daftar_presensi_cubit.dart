import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../injection_container.dart';
import '../../data/models/daftar_presensi_model.dart';
import '../../data/repositories/monitoring_repositories_impl.dart';

part 'daftar_presensi_state.dart';

class DaftarPresensiCubit extends Cubit<DaftarPresensiState> {
  DaftarPresensiCubit() : super(DaftarPresensiInitial());

  DaftarPresensiModel? daftarPresensiModel;

  Future<void> getDaftarPresensis() async {
    emit(DaftarPresensiLoading());

    final result =
        await locator<MonitoringRepositoriesImpl>().getDaftarPresensis();

    result.fold(
      (failure) {
        emit(DaftarPresensiError(failure.message));
      },
      (success) {
        daftarPresensiModel = success;
        if(success.data.isNotEmpty){
          emit(DaftarPresensiLoaded(success.data));
        }else{
          emit(DaftarPresensiEmpty());
        }
      },
    );
  }
}
