part of 'monitoring_bloc.dart';

@immutable
sealed class MonitoringState {}

final class MonitoringInitial extends MonitoringState {}

class MonitoringLoadingState extends MonitoringState {}

class MonitoringLoadedState extends MonitoringState {
  final List<Monitoring> data;
  MonitoringLoadedState(this.data);
}

class MonitoringErrorState extends MonitoringState {
  final String pesan;
  MonitoringErrorState(this.pesan);
}

class DetailMonitoringLoadingState extends MonitoringState {}

class DetailMonitoringLoadedState extends MonitoringState {
  final DetailMonitoring data;
  DetailMonitoringLoadedState(this.data);
}

class DetailMonitoringErrorState extends MonitoringState {
  final String pesan;
  DetailMonitoringErrorState(this.pesan);
}
