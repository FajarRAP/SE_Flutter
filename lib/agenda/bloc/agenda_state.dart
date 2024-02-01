part of 'agenda_bloc.dart';

@immutable
sealed class AgendaState {}

final class AgendaInitial extends AgendaState {}

class AgendaLoading extends AgendaState {}

class AgendaLoaded extends AgendaState {
  final Agenda agenda;
  final bool isBerjalan;
  AgendaLoaded(this.agenda, this.isBerjalan);
}

class AgendaError extends AgendaState {}

class DateCalendarPicked extends AgendaState {
  final String tanggal;
  DateCalendarPicked(this.tanggal);
}

class BerjalanClicked extends AgendaState {}

class SelesaiClicked extends AgendaState {}
