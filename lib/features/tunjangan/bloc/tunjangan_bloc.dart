import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../services/services.dart';
import '../models/detail_tunjangan_model.dart';
import '../models/tunjangan_model.dart';
import '../models/tunjangan_tahun_model.dart';
part 'tunjangan_event.dart';
part 'tunjangan_state.dart';

class TunjanganBloc extends Bloc<TunjanganEvent, TunjanganState> {
  bool showAll = false;
  TunjanganBloc() : super(TunjanganInitial()) {
    on<GetTunjanganEvent>((event, emit) async {
        emit(TunjanganLoading());
        try {
          showAll = !showAll;
          final response = await Services.fetchAPITunjangan(event.selectedDate);  
          
          emit(TunjanganLoaded(data: response, showAll: showAll));       
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
    
    //tidak terpakai karena sudah di handel ama GetTunjanganEvent
    // on<GetDetailTunjanganBerdasarkanTahunEvent>((event,emit)async {
    //   emit(TunjanganTahunLoading());
    //   try {
    //     final result = await Services.fetchAPITunjanganTahun(event.selectedDate);  //mengambil variabel parameter di event
    //     emit(TunjanganTahunLoaded(result));
    //   } catch (e) {
    //     emit(TunjanganTahunError("Gagal Memuat Data..."));
    //   }
    // });
  }
}


