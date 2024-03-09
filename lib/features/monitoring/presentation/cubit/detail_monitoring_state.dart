part of 'detail_monitoring_cubit.dart';

@immutable
sealed class DetailMonitoringState {}

final class DetailMonitoringInitial extends DetailMonitoringState {}

class DetailMonitoring extends DetailMonitoringState {}

class RekapMonitoring extends DetailMonitoringState {}

class DetailMonitoringLoading extends DetailMonitoring {}

class DetailMonitoringLoaded extends DetailMonitoring {}

class DetailMonitoringError extends DetailMonitoring {
  final String message;

  DetailMonitoringError(this.message);
}

class RekapMonitoringLoading extends RekapMonitoring {}

class RekapMonitoringLoaded extends RekapMonitoring {}

class RekapMonitoringError extends RekapMonitoring {
  final String message;

  RekapMonitoringError(this.message);
}

class DatePicked extends DetailMonitoringState {}
