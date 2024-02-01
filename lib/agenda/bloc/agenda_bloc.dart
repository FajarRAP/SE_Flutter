import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../../../services/services.dart';
import '../models/agenda_model.dart';
part 'agenda_event.dart';
part 'agenda_state.dart';

class AgendaBloc extends Bloc<AgendaEvent, AgendaState> {
  AgendaBloc() : super(AgendaInitial()) {
    on<GetAgendaEvent>(getAgendaEvent);
    
  }

  FutureOr<void> getAgendaEvent(
    GetAgendaEvent event,
    Emitter<AgendaState> emit,
  ) async {
    emit(AgendaLoading());
    final results = await Services.fetchAPIAgenda(event.kata, event.tanggal);
    emit(AgendaLoaded(results, event.isBerjalan));
  }

  
}
