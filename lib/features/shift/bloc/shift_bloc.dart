import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../services/services.dart';
import '../models/shift_model.dart';

part 'shift_event.dart';
part 'shift_state.dart';

class ShiftBloc extends Bloc<ShiftEvent, ShiftState> {
  ShiftBloc() : super(ShiftInitial()) {
    on<ShiftEvent>((event, emit) async {
      emit(JadwalShiftLoading());
      try {
        final myResponse = await Services.fetchAPIJadwalShift();
        emit(JadwalShiftLoaded(myResponse));
      } catch (e) {
        emit(JadwalShiftError("Gagal Memuat Data"));
      }
    });
  }
}
