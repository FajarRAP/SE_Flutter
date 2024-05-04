import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../injection_container.dart';
import '../../data/models/rekap_bulanan.dart';
import '../../data/repositories/monitoring_repositories_impl.dart';

part 'rekap_bulanan_state.dart';

class RekapBulananCubit extends Cubit<RekapBulananState> {
  RekapBulananCubit() : super(RekapBulananInitial());

  RekapBulananModel? rekapBulanan;

  Future<void> getRekapBulans() async {
    emit(RekapBulananLoading());

    final result =
        await locator<MonitoringRepositoriesImpl>().getRekapBulanan();

    result.fold(
      (failure) {
        emit(RekapBulananError(failure.message));
      },
      (success) {
          emit(RekapBulananLoaded(success.data));
      },
    );
  }
}
