part of 'agenda_cubit.dart';

@immutable
sealed class AgendaState {}

final class AgendaInitial extends AgendaState {}

class Agenda extends AgendaState {}

class RekapAgenda extends AgendaState {}

class AgendaLoading extends Agenda {}

class AgendaLoaded extends Agenda {
  final List<DataAgendaModel> data;

  AgendaLoaded(this.data);
}

class AgendaEmpty extends Agenda {}

class AgendaError extends Agenda {
  final String message;

  AgendaError(this.message);
}

class RekapAgendaLoading extends RekapAgenda {}

class RekapAgendaLoaded extends RekapAgenda {
  final DataRekapAgendaModel data;
  RekapAgendaLoaded(this.data);
}
