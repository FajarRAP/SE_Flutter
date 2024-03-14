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

  Future<void> getTunjangans() async {
    emit(TunjanganLoading());

    final result = await locator<TunjanganRepositoriesImpl>().getTunjangans();

    result.fold(
      (l) {
        emit(TunjanganError(l.message));
      },
      (r) {
        tunjangan = r;
        if (tunjangan!.data.isNotEmpty) {
          emit(TunjanganLoaded(r.data));
        } else {
          emit(TunjanganEmpty());
        }
      },
    );
  }
}
