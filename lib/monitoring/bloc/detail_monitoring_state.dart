part of 'detail_monitoring_bloc.dart';

@immutable
sealed class DetailMonitoringState {}

final class DetailMonitoringInitial extends DetailMonitoringState {}

class DetailMonitoringLoadingState extends DetailMonitoringState {}

class DetailMonitoringLoadedState extends DetailMonitoringState {
  final MonitoringRekap rekap;
  final MonitoringDetail detail;
  final bool isPie;
  DetailMonitoringLoadedState({
    required this.rekap,
    required this.detail,
    this.isPie = true,
  });
  DetailMonitoringLoadedState copyWith({
    MonitoringRekap? rekap,
    MonitoringDetail? detail,
    bool? isPie,
  }) {
    return DetailMonitoringLoadedState(
      rekap: rekap ?? this.rekap,
      detail: detail ?? this.detail,
      isPie: isPie ?? this.isPie,
    );
  }
}

class DetailMonitoringErrorState extends DetailMonitoringState {
  final String pesan;
  DetailMonitoringErrorState(this.pesan);
}

class ChartChanged extends DetailMonitoringState {}
