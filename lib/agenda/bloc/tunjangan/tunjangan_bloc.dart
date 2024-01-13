import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/tunjangan/detail_tunjangan_model.dart';
import '../../models/tunjangan/tunjangan_model.dart';
import '../../models/tunjangan/tunjangan_tahun_model.dart';
import '../../services/services.dart';
part 'tunjangan_event.dart';
part 'tunjangan_state.dart';

class TunjanganBloc extends Bloc<TunjanganEvent, TunjanganState> {
  TunjanganBloc() : super(TunjanganInitial()) {
    on<GetTunjanganEvent>((event, emit) async {
        emit(TunjanganLoading());
        try {
          final response = await Services.fetchAPITunjangan();  
          emit(TunjanganLoaded(response));       
        } catch (e) {
          emit(TunjanganError("Gagal Memuat Data.."));
        }
    });
    on<GetDetailTunjanganEvent>((event, emit) async {
        emit(TunjanganDetailLoading());
        try {
          final result = await Services.fetchAPIDetailTunjangan();   
          emit(TunjanganDetailLoaded(result));       
        } catch (e) {
          emit(TunjanganDetailError("Gagal Memuat Data..."));
        }
    });

    on<GetDetailTunjanganBerdasarkanTahunEvent>((event,emit)async {
      emit(TunjanganTahunLoading());
      try {
        print(event.selectedDate);
        final result = await Services.fetchAPITunjanganTahun(event.selectedDate);  //mengambil variabel parameter di event
        // print();
        print(result.data[0].periode);
        emit(TunjanganTahunLoaded(result));
      } catch (e) {
        emit(TunjanganTahunError("Gagal Memuat Data..."));
      }
    });
  }
}


