import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../services/services.dart';
import '../models/cuti-rekap_model.dart';
import '../models/cuti-daftar_model.dart';

part 'layanan_cuti_event.dart';
part 'layanan_cuti_state.dart';

class LayananCutiBloc extends Bloc<LayananCutiEvent, LayananCutiState> {
  LayananCutiBloc() : super(LayananCutiInitial()) {
    on<GetLayananCutiEvent>(getLayananCutiEvent);
  }

  FutureOr<void> getLayananCutiEvent(
    GetLayananCutiEvent event,
    Emitter<LayananCutiState> emit,
  ) async {
    emit(LayananCutiLoading());
    final CutiRekap cutiRekap = await Services.fetchAPICutiRekap();
    final CutiDaftar cutiDaftar = await Services.fetchAPICutiTahunan();
    emit(LayananCutiLoaded(
        cutiRekap: cutiRekap,
        cutiDaftar: cutiDaftar,
        isBerjalan: event.isBerjalan));
  }
}
