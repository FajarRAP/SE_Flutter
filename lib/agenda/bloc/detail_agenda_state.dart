part of 'detail_agenda_bloc.dart';

@immutable
sealed class DetailAgendaState {}

final class DetailAgendaInitial extends DetailAgendaState {}

class DetailAgendaLoading extends DetailAgendaState {}

class DetailAgendaLoaded extends DetailAgendaState {
  final AgendaDetail data;
  DetailAgendaLoaded(this.data);
}

class DetailAgendaError extends DetailAgendaState {}