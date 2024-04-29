import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../../../injection_container.dart';
import '../../data/models/tunjangan_model.dart';
import '../../data/repositories/tunjangan_repositories_impl.dart';

part 'tunjangan_state.dart';

class TunjanganCubit extends Cubit<TunjanganState> {
  TunjanganCubit() : super(TunjanganInitial());

  TunjanganModel? tunjangan;
  //variabel untuk waktu
  String tanggal = '';
  String datePicked = DateFormat('M, yyyy').format(DateTime.now());

  // Getter
  String get getDatePicked => datePicked;

  // Setter
  set setTanggal(final DateTime date) =>
      tanggal = DateFormat('dd-MM-yyyy').format(date);
  set setDatePicked(final DateTime date) =>
      datePicked = DateFormat('M, yyyy').format(date);

  Future<void> getTunjangans() async {
    emit(TunjanganLoading());
    final result =
        await locator<TunjanganRepositoriesImpl>().getTunjangans(tanggal);
    result.fold(
      (failure) {
        emit(TunjanganError(failure.message));
      },
      (success) {
        tunjangan = success;

        if (success.data.isNotEmpty) {
          emit(TunjanganLoaded(success.data));
        } else {
          emit(TunjanganEmpty());
        }
      },
    );
  }
}
