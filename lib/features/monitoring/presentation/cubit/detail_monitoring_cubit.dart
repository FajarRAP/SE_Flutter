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

  DataRekapMonitoringModel get dataRekapMonitoring => rekapMonitoring!.data;
  List<DataDetailMonitoringModel> get dataDetailMonitoring =>
      detailMonitoring!.data;
  String get getTanggal => tanggal;
  String get getNama => nama;

  set setNama(final String nama) => this.nama = nama;
  set setTanggal(final DateTime tanggal) {
    emit(DatePicked());
    this.tanggal = DateFormat('M, y').format(tanggal);
  }

  Future<void> getRekapMonitoring() async {
    emit(RekapMonitoringLoading());

    final result =
        await locator<MonitoringRepositoriesImpl>().getRekapMonitoring();

    result.fold(
      (l) {
        emit(RekapMonitoringError(l.message));
      },
      (r) {
        rekapMonitoring = r;
        emit(RekapMonitoringLoaded());
      },
    );
  }

  Future<void> getDetailMonitoring() async {
    emit(DetailMonitoringLoading());

    final result =
        await locator<MonitoringRepositoriesImpl>().getDetailMonitoring();
    result.fold(
      (l) {
        emit(DetailMonitoringError(l.message));
      },
      (r) {
        detailMonitoring = r;
        emit(DetailMonitoringLoaded());
      },
    );
  }

  void changeChart() {
    emit(RekapMonitoringLoaded());
    isPie = !isPie;
  }
}
