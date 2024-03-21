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
      (failure) {
        emit(GajiError(failure.message));
      },
      (success) {
        gajiModel = success;
        if (success.data.isNotEmpty) {
          emit(GajiLoaded(success.data));
        } else {
          emit(GajiEmpty());
        }
      },
    );
  }
}
