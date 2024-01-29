part of 'monitoring_bloc.dart';

@immutable
sealed class MonitoringState {}

final class MonitoringInitial extends MonitoringState {}

class MonitoringLoadingState extends MonitoringState {}

class MonitoringLoadedState extends MonitoringState {
  final Monitoring data;
  MonitoringLoadedState(this.data);
}

class MonitoringErrorState extends MonitoringState {
  final String pesan;
  MonitoringErrorState(this.pesan);
}

class DetailMonitoringLoadingState extends MonitoringState {}

class DetailMonitoringLoadedState extends MonitoringState {
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

class DetailMonitoringErrorState extends MonitoringState {
  final String pesan;
  DetailMonitoringErrorState(this.pesan);
}

class ChartChanged extends MonitoringState {}
