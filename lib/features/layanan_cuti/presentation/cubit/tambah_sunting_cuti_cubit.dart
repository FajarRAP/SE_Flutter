import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../data/models/cuti.dart';

part 'tambah_sunting_cuti_state.dart';

class TambahSuntingCutiCubit extends Cubit<TambahSuntingCutiState> {
  TambahSuntingCutiCubit() : super(TambahSuntingCutiInitial());
  DataCutiModel? dataCutiModel;

  void ubahTanggalMulai(final DateTime date) {
    emit(DatePicked());
    dataCutiModel!.tanggalMulai = DateFormat('d MMMM y').format(date);
  }

  void ubahTanggalSelesai(final DateTime date) {
    emit(DatePicked());
    dataCutiModel!.tanggalSelesai = DateFormat('d MMMM y').format(date);
  }
}
