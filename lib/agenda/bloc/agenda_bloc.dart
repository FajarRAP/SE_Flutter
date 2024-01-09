import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:konsumsi_api_agenda/agenda/models/agenda-detail_model.dart';
import 'package:konsumsi_api_agenda/agenda/models/agenda_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

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
    final results = await fetchAPIAgenda(event.kata, event.date);
    emit(AgendaLoaded(results));
  }

  FutureOr<void> getAgendaDetailEvent(
    GetAgendaDetailEvent event,
    Emitter<AgendaState> emit,
  ) async {
    emit(AgendaDetailLoading());
    final results = await fetchAPIAgendaDetail();
    emit(AgendaDetailLoaded(results));
  }

  FutureOr<void> clickCalendarEvent(
    ClickCalendarEvent event,
    Emitter<AgendaState> emit,
  ) {
    emit(DateCalendarPicked());
  }
}

Future<AgendaDetail> fetchAPIAgendaDetail() async {
  final response = await http
      .get(Uri.parse("https://dev.laz-almuthiin.com/api/detil_agenda"));
  if (response.statusCode == 200) {
    AgendaDetail data = agendaDetailFromJson(response.body);
    return data;
  }
  throw Exception("Gagal Mengambil Data");
}

Future<Agenda> fetchAPIAgenda(String key, String bulan) async {
  final response = await http.get(Uri.parse(
      "https://dev.laz-almuthiin.com/api/agenda?key=$key&bulan=$bulan"));
  if (response.statusCode == 200) {
    Agenda data = agendaFromJson(response.body);
    return data;
  }
  throw Exception("Gagal Mengambil Data");
}
