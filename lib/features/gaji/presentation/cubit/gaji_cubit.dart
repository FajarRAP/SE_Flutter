import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../injection_container.dart';
import '../../data/models/gaji.dart';
import '../../data/repositores/gaji_repositories_impl.dart';

part 'gaji_state.dart';

class GajiCubit extends Cubit<GajiState> {
  GajiCubit() : super(GajiInitial());

  GajiModel? gajiModel;

  Future<void> getGajis() async {
    emit(GajiLoading());

    final result = await locator<GajiRepositoriesImpl>().getGajis();

    result.fold(
      (l) {
        emit(GajiError(l.message));
      },
      (r) {
        gajiModel = r;
        if (r.data.isNotEmpty) {
          emit(GajiLoaded());
        } else {
          emit(GajiEmpty());
        }
      },
    );
  }
}
