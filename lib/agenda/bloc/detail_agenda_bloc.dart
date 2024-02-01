import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../models/agenda-detail_model.dart';
import '../../services/services.dart';

part 'detail_agenda_event.dart';
part 'detail_agenda_state.dart';

class DetailAgendaBloc extends Bloc<DetailAgendaEvent, DetailAgendaState> {
  DetailAgendaBloc() : super(DetailAgendaInitial()) {
    on<GetAgendaDetailEvent>(getAgendaDetailEvent);
  }

  FutureOr<void> getAgendaDetailEvent(
    GetAgendaDetailEvent event,
    Emitter<DetailAgendaState> emit,
  ) async {
    emit(DetailAgendaLoading());
    final results = await Services.fetchAPIAgendaDetail();
    emit(DetailAgendaLoaded(results));
  }
}
