import 'package:bloc/bloc.dart';
import 'package:konsumsi_api_agenda/gaji/models/gaji_model.dart';
import 'package:konsumsi_api_agenda/services/services.dart';
import 'package:meta/meta.dart';

import '../models/detail_gaji_model.dart';

part 'gaji_event.dart';
part 'gaji_state.dart';

class GajiBloc extends Bloc<GajiEvent, GajiState> {
  GajiBloc() : super(GajiInitial()) {
    on<GetGajiEvent>(
      (event, emit) async {
        // TODO: implement event handler
        emit(GajiLoading());
        try {
          final response = await Services.fetchAPIGaji();
          emit(GajiLoaded(response));
        } catch (e) {
          emit(GajiError('Gagal Memuat Data...'));
        }
      },
    );
    on<GetDetailGajiEvent>(
      (event, emit) async {
        emit(DetailGajiLoading());
        try {
          final response = await Services.fetchAPIDetailGaji();
          emit(DetailGajiLoaded(response));
        } catch (e) {
          emit(DetailGajiError('Gagal Memuat Data...'));
        }
      },
    );
  }
}
