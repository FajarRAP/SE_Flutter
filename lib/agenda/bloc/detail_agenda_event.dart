part of 'detail_agenda_bloc.dart';

@immutable
sealed class DetailAgendaEvent {}
class GetAgendaDetailEvent extends DetailAgendaEvent {}