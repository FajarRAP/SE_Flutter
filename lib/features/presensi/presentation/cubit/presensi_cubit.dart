import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


import '../../data/models/presensi.dart';
import '../../data/models/presensi_detil_model.dart';
import '../../data/models/rekap_presensi.dart';
import '../../data/models/today_presensi.dart';
import '../../data/repositories/presensi_repositories_impl.dart';
import '../../dependency_injection_presensi.dart';

part 'presensi_state.dart';

class PresensiCubit extends Cubit<PresensiState> {
  PresensiCubit() : super(PresensiInitial());

  DataTodayPresensiModel? dataTodayPresensi;
  DataRekapPresensi? dataRekapPresensi;

  String get getTanggal => dataTodayPresensi!.tanggal;
  String get getStatus => dataTodayPresensi!.statusPresensi;
  String get getLokasi => dataTodayPresensi!.lokasi;
  String get getInsentif => dataTodayPresensi!.nominalInsentif;
  String get getJamMasuk => dataTodayPresensi!.jamMasuk;
  String get getJamPulang => dataTodayPresensi!.jamPulang;

  DataRekapPresensi get getDataRekap => dataRekapPresensi!;
  double get getTepat => double.tryParse(getDataRekap.jumlahTepatWaktu) ?? 0.0;
  double get getTelat => double.tryParse(getDataRekap.jumlahTelat) ?? 0.0;
  double get getAbsen => double.tryParse(getDataRekap.jumlahAbsen) ?? 0.0;

  Future<void> getRekapPresensi() async {
    emit(RekapPresensiLoading());

    final results =
        await locator<PresensiRepositoriesImpl>().getRekapPresensi();

    results.fold(
      (failure) {
        emit(RekapPresensiError(failure.message));
      },
      (success) {
        dataRekapPresensi = success.data;
        emit(RekapPresensiLoaded(success.data));
      },
    );
  }

  Future<void> getTodayPresensi() async {
    emit(TodayPresensiLoading());

    final results =
        await locator<PresensiRepositoriesImpl>().getTodayPresensi();

    results.fold(
      (failure) {
        emit(TodayPresensiError(failure.message));
      },
      (success) {
        dataTodayPresensi = success.data;
        emit(TodayPresensiLoaded(success.data));
      },
    );
  }

  Future<void> getDaftarPresensi() async {
    emit(DaftarPresensiLoading());
    final results =
        await locator<PresensiRepositoriesImpl>().getDaftarPresensi();

    results.fold(
      (failure) {
        emit(DaftarPresensiError(failure.message));
      },
      (success) {
        emit(DaftarPresensiLoaded(success.data));
      },
    );
  }

  Future<void> getDetilPresensis() async {
    emit(DetilPresensiLoading());
    final result = await locator<PresensiRepositoriesImpl>().getDetilPresensi();

    result.fold(
      (failure) {
        emit(DetilPresensiError(failure.message));
      },
      (success) {
        emit(DetilPresensiLoaded(success.data));
      },
    );
  }
}
