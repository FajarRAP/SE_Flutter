import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../models/monitoring_model.dart';
import '../../services/services.dart';

part 'monitoring_event.dart';
part 'monitoring_state.dart';

class MonitoringBloc extends Bloc<MonitoringEvent, MonitoringState> {
  MonitoringBloc() : super(MonitoringInitial()) {
    on<GetMonitoringEvent>(getMonitoringEvent);
  }

  FutureOr<void> getMonitoringEvent(
    GetMonitoringEvent event,
    Emitter<MonitoringState> emit,
  ) async {
    emit(MonitoringLoadingState());
    try {
      final List<Monitoring> data = await Services.fetchAPIMonitoring();
      emit(MonitoringLoadedState(data));
    } catch (e) {
      emit(MonitoringErrorState(e.toString()));
    }
  }
}
