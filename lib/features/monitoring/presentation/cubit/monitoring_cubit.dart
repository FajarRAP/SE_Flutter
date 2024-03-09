import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../injection_container.dart';
import '../../data/models/monitoring.dart';
import '../../data/repositories/monitoring_repositories_impl.dart';

part 'monitoring_state.dart';

class MonitoringCubit extends Cubit<MonitoringState> {
  MonitoringCubit() : super(MonitoringInitial());
  MonitoringModel? monitoringModel;

  List<DataMonitoringModel> get dataMonitoring => monitoringModel!.data;

  Future<void> getMonitorings() async {
    emit(MonitoringLoading());

    final result = await locator<MonitoringRepositoriesImpl>().getMonitorings();

    result.fold(
      (l) {
        emit(MonitoringError(l.message));
      },
      (r) {
        monitoringModel = r;
        if (dataMonitoring.isNotEmpty) {
          emit(MonitoringLoaded());
        } else {
          emit(MonitoringEmpty());
        }
      },
    );
  }
}
