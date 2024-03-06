part of 'detail_monitoring_bloc.dart';

@immutable
sealed class DetailMonitoringEvent {}

class GetDetailMonitoringEvent extends DetailMonitoringEvent {}

class ClickChangeChartEvent extends DetailMonitoringEvent {}
