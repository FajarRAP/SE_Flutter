import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../models/monitoring-detail_model.dart';
import '../models/monitoring-rekap_model.dart';
import '../../../services/services.dart';

part 'detail_monitoring_event.dart';
part 'detail_monitoring_state.dart';

class DetailMonitoringBloc
    extends Bloc<DetailMonitoringEvent, DetailMonitoringState> {
  bool isPie = true;
  DetailMonitoringBloc() : super(DetailMonitoringInitial()) {
    on<GetDetailMonitoringEvent>(getDetailMonitoringEvent);
    on<ClickChangeChartEvent>(clickChangeChartEvent);
  }
  FutureOr<void> getDetailMonitoringEvent(
    GetDetailMonitoringEvent event,
    Emitter<DetailMonitoringState> emit,
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
    Emitter<DetailMonitoringState> emit,
  ) {
    if (state is DetailMonitoringLoadedState) {
      isPie = !isPie;
      final currentState = state as DetailMonitoringLoadedState;
      emit(currentState.copyWith(isPie: isPie));
    }
  }
}
