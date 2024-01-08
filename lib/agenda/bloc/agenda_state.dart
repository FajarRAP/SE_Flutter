part of 'agenda_bloc.dart';

@immutable
sealed class AgendaState {}

final class AgendaInitial extends AgendaState {}

class AgendaLoading extends AgendaState {}

class AgendaLoaded extends AgendaState {
  final Agenda data;
  AgendaLoaded(this.data);
}

class AgendaError extends AgendaState {}

class AgendaDetailLoading extends AgendaState {}

class AgendaDetailLoaded extends AgendaState {
  final AgendaDetail data;
  AgendaDetailLoaded(this.data);
}

class AgendaDetailError extends AgendaState {}
