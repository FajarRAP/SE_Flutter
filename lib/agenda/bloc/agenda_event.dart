part of 'agenda_bloc.dart';

@immutable
sealed class AgendaEvent {}

class GetAgendaEvent extends AgendaEvent {
  final String kata;
  final String tanggal;
  final bool isBerjalan;

  GetAgendaEvent({
    required this.kata,
    required this.tanggal,
    required this.isBerjalan,
  });
}

class GetAgendaDetailEvent extends AgendaEvent {}
