import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../injection_container.dart';
import '../../data/models/cuti.dart';
import '../../data/models/rekap_cuti.dart';
import '../../data/repositories/cuti_repositories_impl.dart';

part 'cuti_state.dart';

class CutiCubit extends Cubit<CutiState> {
  CutiCubit() : super(CutiInitial());

  CutiModel? cuti;
  RekapCutiModel? rekapCuti;
  bool isBerjalan = true;

  // Getter
  bool get getIsBerjalan => isBerjalan;

  Future<void> getCutis() async {
    emit(CutiLoading());

    final result = await locator<CutiRepositoriesImpl>().getCutis();

    result.fold(
      (failure) {
        emit(CutiError(message: failure.message));
      },
      (success) {
        cuti = success;
        if (success.data.isNotEmpty) {
          emit(CutiLoaded(success.data));
        } else {
          emit(CutiEmpty());
        }
      },
    );
  }

  Future<void> getRekapCuti() async {
    emit(RekapCutiLoading());

    final result = await locator<CutiRepositoriesImpl>().getRekapCuti();

    result.fold(
      (failure) {
        emit(RekapCutiError(message: failure.message));
      },
      (success) {
        rekapCuti = success;
        emit(RekapCutiLoaded(success.data));
      },
    );
  }

  void clickBerjalan() {
    isBerjalan = true;
  }

  void clickSelesai() {
    isBerjalan = false;
  }
}
