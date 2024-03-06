import 'package:bloc/bloc.dart';
import 'package:konsumsi_api_agenda/injection_container.dart';
import 'package:meta/meta.dart';

import '../../data/models/detail_agenda.dart';
import '../../data/repositories/agenda_repositories_impl.dart';

part 'detail_agenda_state.dart';

class DetailAgendaCubit extends Cubit<DetailAgendaState> {
  DetailAgendaCubit() : super(DetailAgendaInitial());

  DetailAgendaModel? detailAgenda;

  Future<void> getDetailAgenda() async {
    emit(DetailAgendaLoading());

    final result = await locator<AgendaRepositoriesImpl>().getDetailAgenda();

    result.fold((failure) {
      emit(DetailAgendaError(failure.message));
    }, (data) {
      detailAgenda = data;
      emit(DetailAgendaLoaded());
    });
  }
}
