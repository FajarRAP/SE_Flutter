import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../injection_container.dart';
import '../../data/models/detail_tunjangan_model.dart';
import '../../data/repositories/tunjangan_repositories_impl.dart';

part 'detail_tunjangan_state.dart';

class DetailTunjanganCubit extends Cubit<DetailTunjanganState> {
  DetailTunjanganCubit() : super(DetailTunjanganInitial());

  DetailTunjanganModel? detailTunjangan;

  Future<void> getDetailTunjangan() async {
    emit(DetailTunjanganLoading());
    final result =
        await locator<TunjanganRepositoriesImpl>().getDetailTunjangan();
    result.fold(
      (failure) => emit(DetailTunjanganError(failure.message)),
      (data) {
        detailTunjangan = data;
        if (detailTunjangan!.data.isNotEmpty) {
          emit(DetailTunjanganLoaded());
        } else {
          emit(DetailTunjanganEmpty());
        }
      },
    );
  }
}
