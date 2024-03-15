import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../injection_container.dart';
import '../../data/models/monitoring.dart';
import '../../data/repositories/monitoring_repositories_impl.dart';

part 'monitoring_state.dart';

class MonitoringCubit extends Cubit<MonitoringState> {
  MonitoringCubit() : super(MonitoringInitial());

  MonitoringModel? monitoringModel;

  Future<void> getMonitorings() async {
    emit(MonitoringLoading());

    final result = await locator<MonitoringRepositoriesImpl>().getMonitorings();

    result.fold(
      (failure) {
        emit(MonitoringError(failure.message));
      },
      (success) {
        monitoringModel = success;
        if (success.data.isNotEmpty) {
          emit(MonitoringLoaded(success.data));
        } else {
          emit(MonitoringEmpty());
        }
      },
    );
  }
}
