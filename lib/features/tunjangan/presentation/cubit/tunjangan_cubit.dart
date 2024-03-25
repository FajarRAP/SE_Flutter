import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../injection_container.dart';
import '../../data/models/tunjangan_model.dart';
import '../../data/repositories/tunjangan_repositories_impl.dart';

part 'tunjangan_state.dart';

class TunjanganCubit extends Cubit<TunjanganState> {
  TunjanganCubit() : super(TunjanganInitial());

  TunjanganModel? tunjangan;

  Future<void> getTunjangans(String date) async {
    emit(TunjanganLoading());
    final result =
        await locator<TunjanganRepositoriesImpl>().getTunjangans(date);
    result.fold(
      (failure) => emit(TunjanganError(failure.message)),
      (data) {
        tunjangan = data;

        if(tunjangan!.data.isNotEmpty){
          emit(TunjanganLoaded(tunjangan!.data));
        }else{
          emit(TunjanganEmpty());
        }
      },
    );
  }
}
