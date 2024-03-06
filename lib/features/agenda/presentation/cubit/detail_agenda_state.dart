part of 'detail_agenda_cubit.dart';

@immutable
sealed class DetailAgendaState {}

final class DetailAgendaInitial extends DetailAgendaState {}

class DetailAgendaLoading extends DetailAgendaState {}

class DetailAgendaLoaded extends DetailAgendaState {}

class DetailAgendaError extends DetailAgendaState {
  final String message;

  DetailAgendaError(this.message);
}
