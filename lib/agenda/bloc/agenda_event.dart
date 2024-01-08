part of 'agenda_bloc.dart';

@immutable
sealed class AgendaEvent {}

class GetAgendaEvent extends AgendaEvent {}

class GetAgendaDetailEvent extends AgendaEvent {
  final String id;
  GetAgendaDetailEvent(this.id);
}
