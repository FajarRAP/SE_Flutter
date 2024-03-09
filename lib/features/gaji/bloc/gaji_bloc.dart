import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../services/services.dart';
import '../data/models/detail_gaji_model.dart';
import '../data/models/gaji.dart';

part 'gaji_event.dart';
part 'gaji_state.dart';

class GajiBloc extends Bloc<GajiEvent, GajiState> {
  GajiBloc() : super(GajiInitial()) {
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
