import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../services/services.dart';
import '../models/keterangan-cuti_model.dart';
import '../models/cuti-tahunan_model.dart';

part 'layanan_cuti_event.dart';
part 'layanan_cuti_state.dart';

class LayananCutiBloc extends Bloc<LayananCutiEvent, LayananCutiState> {
  LayananCutiBloc() : super(LayananCutiInitial()) {
    on<GetKeteranganCutiEvent>(getKeteranganCutiEvent);
    on<GetCutiTahunanEvent>(getCutiTahunanEvent);
    on<GetLayananCutiEvent>(getLayananCutiEvent);
  }

  FutureOr<void> getKeteranganCutiEvent(
    GetKeteranganCutiEvent event,
    Emitter<LayananCutiState> emit,
  ) async {
    emit(KeteranganCutiLoading());
    final data = await Services.fetchAPIKeteranganCuti();
    emit(KeteranganCutiLoaded(data));
  }

  FutureOr<void> getCutiTahunanEvent(
    GetCutiTahunanEvent event,
    Emitter<LayananCutiState> emit,
  ) async {
    emit(CutiTahunanLoading());
    final data = await Services.fetchAPICutiTahunan();
    emit(CutiTahunanLoaded(data));
  }

  FutureOr<void> getLayananCutiEvent(
    GetLayananCutiEvent event,
    Emitter<LayananCutiState> emit,
  ) async {
    emit(LayananCutiLoading());
    final KeteranganCuti keteranganCuti =
        await Services.fetchAPIKeteranganCuti();
    final List<CutiTahunan> cutiTahunan = await Services.fetchAPICutiTahunan();
    emit(LayananCutiLoaded(keteranganCuti, cutiTahunan));
  }
}
