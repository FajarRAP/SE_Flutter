part of 'monitoring_bloc.dart';

@immutable
sealed class MonitoringEvent {}

class GetMonitoringEvent extends MonitoringEvent {}

class GetDetailMonitoringEvent extends MonitoringEvent {}
