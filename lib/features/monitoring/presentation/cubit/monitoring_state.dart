part of 'monitoring_cubit.dart';

@immutable
sealed class MonitoringState {}

final class MonitoringInitial extends MonitoringState {}

class MonitoringLoading extends MonitoringState {}

class MonitoringLoaded extends MonitoringState {
  final List<DataMonitoringModel> data;

  MonitoringLoaded(this.data);
}

class MonitoringEmpty extends MonitoringState {}

class MonitoringError extends MonitoringState {
  final String message;

  MonitoringError(this.message);
}
