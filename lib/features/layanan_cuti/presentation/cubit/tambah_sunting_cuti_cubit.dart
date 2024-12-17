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

  String get getTglMulai => dataCutiModel.tanggalMulai;
  String get getTglSelesai => dataCutiModel.tanggalSelesai;
  String get getKeterangan => dataCutiModel.keterangan;

  set setTglMulai(final String tanggal) => dataCutiModel.tanggalMulai = tanggal;
  set setTglSelesai(final String tanggal) =>
      dataCutiModel.tanggalSelesai = tanggal;
  set setKeterangan(final String keterangan) =>
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
