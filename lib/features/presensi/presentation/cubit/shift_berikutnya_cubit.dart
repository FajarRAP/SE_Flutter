import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';


import '../../data/models/shift_berikutnya_model.dart';
import '../../data/repositories/shift_berikutnya_repositories_impl.dart';
import '../../dependency_injection_presensi.dart';

part 'shift_berikutnya_state.dart';

class ShiftBerikutnyaCubit extends Cubit<ShiftBerikutnyaState> {
  ShiftBerikutnyaCubit() : super(ShiftBerikutnyaInitial());

  ShiftBerikutnyaModel? shiftBerikutnyaModel;


  Future<void> getShiftBerikutnyas() async {
    emit(ShiftBerikutnyaLoading());

    final result = await locator<ShiftBerikutnyaRepositoriesImpl>().getShiftBerikutnyas();

    result.fold((failure) {
      emit(ShiftBerikutnyaError(failure.message));
    }, (success) {
      shiftBerikutnyaModel = success;
      if(success.data.isNotEmpty){
        emit(ShiftBerikutnyaLoaded(success.data));
      }else{
        emit(ShiftBerikutnyaEmpty());
      }
    },);
  }
}
