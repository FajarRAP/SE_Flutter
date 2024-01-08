part of 'agenda_bloc.dart';

@immutable
sealed class AgendaEvent {}

class GetAgendaEvent extends AgendaEvent {
  final String kata;
  final String date;
  GetAgendaEvent({this.kata = "", this.date = ""});
}

class GetAgendaDetailEvent extends AgendaEvent {
  final String id;
  GetAgendaDetailEvent(this.id);
}

class ClickButtonBerjalanEvent extends AgendaEvent {}

class ClickButtonSelesaiEvent extends AgendaEvent {}

class ClickCalendarEvent extends AgendaEvent {}
