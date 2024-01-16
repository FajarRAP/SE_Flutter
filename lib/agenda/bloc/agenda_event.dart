part of 'agenda_bloc.dart';

@immutable
sealed class AgendaEvent {}

class GetAgendaEvent extends AgendaEvent {
  final String kata;
  final String tanggal;

  GetAgendaEvent({required this.kata, required this.tanggal});
}

class GetAgendaDetailEvent extends AgendaEvent {}

class ClickCalendarEvent extends AgendaEvent {
  final String tanggal;
  ClickCalendarEvent(this.tanggal);
}

class ClickBerjalanEvent extends AgendaEvent {}

class ClickSelesaiEvent extends AgendaEvent {}
