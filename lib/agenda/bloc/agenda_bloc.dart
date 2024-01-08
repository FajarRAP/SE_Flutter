import 'package:bloc/bloc.dart';
import 'package:konsumsi_api_agenda/agenda/models/agenda-detail_model.dart';
import 'package:konsumsi_api_agenda/agenda/models/agenda_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'agenda_event.dart';
part 'agenda_state.dart';

class AgendaBloc extends Bloc<AgendaEvent, AgendaState> {
  AgendaBloc() : super(AgendaInitial()) {
    on<GetAgendaEvent>((event, emit) async {
      emit(AgendaLoading());
      final response =
          await http.get(Uri.parse("https://dev.laz-almuthiin.com/api/agenda"));
      emit(AgendaLoaded(agendaFromJson(response.body)));
    });
    on<GetAgendaDetailEvent>((event, emit) async {
      emit(AgendaDetailLoading());
      final response = await http
          .get(Uri.parse("https://dev.laz-almuthiin.com/api/detil_agenda"));
      emit(AgendaDetailLoaded(agendaDetailFromJson(response.body)));
    });
  }
}
