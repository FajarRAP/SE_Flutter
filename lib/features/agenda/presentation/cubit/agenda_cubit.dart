import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:konsumsi_api_agenda/features/agenda/data/data_sources/remote.dart';
import 'package:meta/meta.dart';

import '../../../../injection_container.dart';
import '../../data/models/agenda.dart';
import '../../data/repositories/agenda_repositories_impl.dart';

part 'agenda_state.dart';

class AgendaCubit extends Cubit<AgendaState> {
  AgendaCubit() : super(AgendaInitial());

  AgendaModel? agenda;
  String tanggal = '';
  String kata = '';
  String datePicked = DateFormat('M, yyyy').format(DateTime.now());
  bool isBerjalan = true;

  Future<void> getAgendas() async {
    emit(AgendaLoading());
    // final result =  await AgendaRepositoriesImpl(agendaService: AgendaService()).getAgendas(kata,tanggal, isBerjalan);
    final result = await locator<AgendaRepositoriesImpl>()
        .getAgendas(kata, tanggal, isBerjalan);
    result.fold(
      (failure) {
        emit(AgendaError(failure.message));
      },
      (data) {
        agenda = data;
        if (agenda!.data.isNotEmpty) {
          emit(AgendaLoaded());
        } else {
          emit(AgendaEmpty());
        }
      },
    );
  }
}
