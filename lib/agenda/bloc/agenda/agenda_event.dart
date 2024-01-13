part of 'agenda_bloc.dart';

@immutable
sealed class AgendaEvent {}

class GetAgendaEvent extends AgendaEvent {
  final String kata;
  final String date;
  GetAgendaEvent({this.kata = "", this.date = ""});
}

class GetAgendaDetailEvent extends AgendaEvent {}

class ClickCalendarEvent extends AgendaEvent {}
