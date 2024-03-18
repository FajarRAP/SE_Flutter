part of 'agenda_cubit.dart';

@immutable
sealed class AgendaState {}

final class AgendaInitial extends AgendaState{}

class AgendaLoading extends AgendaState {}

class AgendaLoaded extends AgendaState {
  final List<DataAgendaModel> data;

  AgendaLoaded(this.data);
}

class AgendaEmpty extends AgendaState {}

class AgendaError extends AgendaState {
  final String message;

  AgendaError(this.message);
}
