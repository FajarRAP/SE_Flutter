import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../../../injection_container.dart';
import '../../data/models/detail_monitoring.dart';
import '../../data/models/rekap_monitoring.dart';
import '../../data/repositories/monitoring_repositories_impl.dart';

part 'detail_monitoring_state.dart';

class DetailMonitoringCubit extends Cubit<DetailMonitoringState> {
  DetailMonitoringCubit() : super(DetailMonitoringInitial());

  RekapMonitoringModel? rekapMonitoring;
  DetailMonitoringModel? detailMonitoring;
  bool isPie = true;
  String tanggal = DateFormat('M, y').format(DateTime.now());
  String nama = '';

  // Setter
  set setNama(final String nama) => this.nama = nama;

  // Getter
  String get getTanggal => tanggal;
  String get getNama => nama;
  int get getOnTime => rekapMonitoring!.data.onTime;
  int get getTelat => rekapMonitoring!.data.telat;
  int get getAbsen => rekapMonitoring!.data.absen;
  int get getTotalPresensi => getOnTime + getTelat + getAbsen;

  set setTanggal(final DateTime tanggal) {
    this.tanggal = DateFormat('M, y').format(tanggal);
    emit(DatePicked());
  }

  Future<void> getRekapMonitoring() async {
    emit(RekapMonitoringLoading());

    final result =
        await locator<MonitoringRepositoriesImpl>().getRekapMonitoring();

    result.fold(
      (failure) {
        emit(RekapMonitoringError(failure.message));
      },
      (success) {
        rekapMonitoring = success;
        emit(RekapMonitoringLoaded());
      },
    );
  }

  Future<void> getDetailMonitoring() async {
    emit(DetailMonitoringLoading());

    final result =
        await locator<MonitoringRepositoriesImpl>().getDetailMonitoring();

    result.fold(
      (failure) {
        emit(DetailMonitoringError(failure.message));
      },
      (success) {
        detailMonitoring = success;
        emit(DetailMonitoringLoaded(success.data));
      },
    );
  }

  void changeChart() {
    isPie = !isPie;
    emit(RekapMonitoringLoaded());
  }
}
