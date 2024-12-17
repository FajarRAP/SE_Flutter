import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../services/services.dart';
import '../models/agenda-detail_model.dart';
import '../models/agenda_model.dart';
part 'agenda_event.dart';
part 'agenda_state.dart';

class AgendaBloc extends Bloc<AgendaEvent, AgendaState> {
  AgendaBloc() : super(AgendaInitial()) {
    on<GetAgendaEvent>(getAgendaEvent);
    on<GetAgendaDetailEvent>(getAgendaDetailEvent);
    on<ClickCalendarEvent>(clickCalendarEvent);
  }

  FutureOr<void> getAgendaEvent(
    GetAgendaEvent event,
    Emitter<AgendaState> emit,
  ) async {
    emit(AgendaLoading());
    final results = await Services.fetchAPIAgenda(event.kata, event.date);
    emit(AgendaLoaded(results));
  }

  FutureOr<void> getAgendaDetailEvent(
    GetAgendaDetailEvent event,
    Emitter<AgendaState> emit,
  ) async {
    emit(AgendaDetailLoading());
    final results = await Services.fetchAPIAgendaDetail();
    emit(AgendaDetailLoaded(results));
  }

  FutureOr<void> clickCalendarEvent(
    ClickCalendarEvent event,
    Emitter<AgendaState> emit,
  ) {
    emit(DateCalendarPicked());
  }
}