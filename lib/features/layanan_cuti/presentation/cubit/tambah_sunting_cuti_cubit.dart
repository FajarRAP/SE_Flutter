import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../data/models/cuti.dart';

part 'tambah_sunting_cuti_state.dart';

class TambahSuntingCutiCubit extends Cubit<TambahSuntingCutiState> {
  TambahSuntingCutiCubit() : super(TambahSuntingCutiInitial());
  DataCutiModel dataCutiModel = DataCutiModel(
    keterangan: '',
    tanggalMulai: 'Mau Mulai Kapan?',
    tanggalSelesai: 'Mau Ampe Kapan?',
  );

  String get tglMulai => dataCutiModel.tanggalMulai;
  String get tglSelesai => dataCutiModel.tanggalSelesai;
  String get keterangan => dataCutiModel.keterangan;

  set tglMulai(final String tanggal) => dataCutiModel.tanggalMulai = tanggal;
  set tglSelesai(final String tanggal) =>
      dataCutiModel.tanggalSelesai = tanggal;
  set keterangan(final String keterangan) =>
      dataCutiModel.keterangan = keterangan;

  void ubahTanggalMulai(final DateTime date) {
    emit(DatePicked());
    dataCutiModel.tanggalMulai = DateFormat('d MMMM y').format(date);
  }

  void ubahTanggalSelesai(final DateTime date) {
    emit(DatePicked());
    dataCutiModel.tanggalSelesai = DateFormat('d MMMM y').format(date);
  }

  void resetDataCuti() {
    dataCutiModel.tanggalMulai = 'Mau Mulai Kapan?';
    dataCutiModel.tanggalSelesai = 'Mau Ampe Kapan?';
    dataCutiModel.keterangan = '';
  }
}
