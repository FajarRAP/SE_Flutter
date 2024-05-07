import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../../../injection_container.dart';
import '../../data/models/agenda.dart';
import '../../data/models/rekap_agenda.dart';
import '../../data/repositories/agenda_repositories_impl.dart';

part 'agenda_state.dart';

class AgendaCubit extends Cubit<AgendaState> {
  AgendaCubit() : super(AgendaInitial());

  AgendaModel? agenda;
  String tanggal = '';
  String kata = '';
  String datePicked = DateFormat('M, yyyy').format(DateTime.now());
  bool isBerjalan = true;

  // Setter
  set setKata(final String kata) => this.kata = kata;
  set setTanggal(final DateTime date) =>
      tanggal = DateFormat('dd-MM-yyyy').format(date);
  set setDatePicked(final DateTime date) =>
      datePicked = DateFormat('M, yyyy').format(date);

  // Getter
  bool get getIsBerjalan => isBerjalan;
  String get getDatePicked => datePicked;

  // Fungsi
  Future<void> getAgendas() async {
    emit(AgendaLoading());

    final result = await locator<AgendaRepositoriesImpl>()
        .getAgendas(kata, tanggal, isBerjalan);

    result.fold(
      (failure) {
        emit(AgendaError(failure.message));
      },
      (success) {
        agenda = success;

        if (success.data.isNotEmpty) {
          emit(AgendaLoaded(success.data));
        } else {
          emit(AgendaEmpty());
        }
      },
    );
  }

  Future<void> getRekapAgenda() async {
    emit(RekapAgendaLoading());

    final results = await locator<AgendaRepositoriesImpl>().getAgendaRekap();

    results.fold(
      (failure) {
        emit(AgendaError(failure.message));
      },
      (success) {
        emit(RekapAgendaLoaded(success.data));
      },
    );
  }

  void clickBerjalan() {
    isBerjalan = true;
  }

  void clickSelesai() {
    isBerjalan = false;
  }

  void clear() {
    kata = '';
    tanggal = '';
  }
}
