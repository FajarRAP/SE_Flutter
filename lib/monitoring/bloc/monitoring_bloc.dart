import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../models/monitoring_model.dart';
import '../models/monitoring-detail_model.dart';
import '../models/monitoring-rekap_model.dart';
import '../../services/services.dart';

part 'monitoring_event.dart';
part 'monitoring_state.dart';

class MonitoringBloc extends Bloc<MonitoringEvent, MonitoringState> {
  bool isPie = true;
  MonitoringBloc() : super(MonitoringInitial()) {
    on<GetMonitoringEvent>(getMonitoringEvent);
    on<GetDetailMonitoringEvent>(getDetailMonitoringEvent);
    on<ClickChangeChartEvent>(clickChangeChartEvent);
  }

  FutureOr<void> getMonitoringEvent(
    GetMonitoringEvent event,
    Emitter<MonitoringState> emit,
  ) async {
    emit(MonitoringLoadingState());
    try {
      final Monitoring data = await Services.fetchAPIMonitoring();
      emit(MonitoringLoadedState(data));
    } catch (e) {
      emit(MonitoringErrorState(e.toString()));
    }
  }

  FutureOr<void> getDetailMonitoringEvent(
    GetDetailMonitoringEvent event,
    Emitter<MonitoringState> emit,
  ) async {
    emit(DetailMonitoringLoadingState());
    try {
      final MonitoringRekap rekap = await Services.fetchAPIMonitoringRekap();
      final MonitoringDetail detail = await Services.fetchAPIMonitoringDetail();
      emit(DetailMonitoringLoadedState(rekap: rekap, detail: detail));
    } catch (e) {
      emit(DetailMonitoringErrorState(e.toString()));
    }
  }

  FutureOr<void> clickChangeChartEvent(
    ClickChangeChartEvent event,
    Emitter<MonitoringState> emit,
  ) {
    if (state is DetailMonitoringLoadedState) {
      isPie = !isPie;
      final currentState = state as DetailMonitoringLoadedState;
      emit(currentState.copyWith(isPie: isPie));
    }
  }
}
