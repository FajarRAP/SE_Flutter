import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../services/services.dart';
import '../models/detail_gaji_model.dart';
import '../models/gaji_model.dart';

part 'gaji_event.dart';
part 'gaji_state.dart';

class GajiBloc extends Bloc<GajiEvent, GajiState> {
  GajiBloc() : super(GajiInitial()) {
    on<GetGajiEvent>(
      (event, emit) async {
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
