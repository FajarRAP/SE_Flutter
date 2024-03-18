
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../injection_container.dart';
import '../../data/models/gaji_model.dart';
import '../../data/repositories/gaji_repositories_impl.dart';

part 'gaji_state.dart';

class GajiCubit extends Cubit<GajiState> {
  GajiCubit() : super(GajiInitial());

  GajiModel? gaji;

  Future<void> getGaji() async {
    emit(GajiLoading());
    final result = await locator<GajiRepositoriesImpl>().getGaji();
    result.fold(
      (failure) => emit(GajiError(failure.message)),
      (data) {
        gaji = data;
        if (gaji!.data.isNotEmpty) {
          emit(GajiLoaded());
        } else {
          emit(GajiEmpty());
        }
      },
    );
  }
}
