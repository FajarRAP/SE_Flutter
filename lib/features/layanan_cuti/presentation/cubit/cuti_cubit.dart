import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../injection_container.dart';
import '../../data/models/cuti.dart';
import '../../data/models/rekap_cuti.dart';
import '../../data/repositories/cuti_repositories_impl.dart';

part 'cuti_state.dart';

class CutiCubit extends Cubit<CutiState> {
  CutiCubit() : super(CutiInitial());

  CutiModel? cutiModel;
  RekapCutiModel? rekapCutiModel;
  bool isBerjalan = true;

  Future<void> getCutis() async {
    emit(CutiLoading());

    final result = await locator<CutiRepositoriesImpl>().getCutis();

    result.fold(
      (l) {
        emit(CutiError(message: l.message));
      },
      (r) {
        cutiModel = r;
        if (cutiModel!.data.isNotEmpty) {
          emit(CutiLoaded());
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
      (l) {
        emit(RekapCutiError(message: l.message));
      },
      (r) {
        rekapCutiModel = r;
        emit(RekapCutiLoaded());
      },
    );
  }
}
