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
