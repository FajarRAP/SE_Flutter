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

  String datePicked = DateFormat('M, yyyy').format(DateTime.now());

  // Setter
  set setDatePicked(final DateTime date) =>
      datePicked = DateFormat('M, yyyy').format(date);

  // Getter
  String get getDatePicked => datePicked;

  Future<void> getTunjangans() async {
    emit(TunjanganLoading());

    final result = await locator<TunjanganRepositoriesImpl>().getTunjangans();

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
