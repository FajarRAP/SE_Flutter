import 'package:bloc/bloc.dart';
import 'package:latihan_tunjanga/models/detail_tunjangan_model.dart';
import 'package:latihan_tunjanga/models/tunjangan_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'tunjangan_event.dart';
part 'tunjangan_state.dart';

class TunjanganBloc extends Bloc<TunjanganEvent, TunjanganState> {
  TunjanganBloc() : super(TunjanganInitial()) {
    on<GetTunjanganEvent>((event, emit) async {
        emit(TunjanganLoading());
        try {
          final response = await fetchAPITunjangan();   
          emit(TunjanganLoaded(response));       
        } catch (e) {
          emit(TunjanganError("Gagal Memuat Data..."));
        }
    });
    on<GetDetailTunjanganEvent>((event, emit) async {
        emit(TunjanganDetailLoading());
        try {
          final result = await fetchAPIDetailTunjangan();   
          emit(TunjanganDetailLoaded(result));       
        } catch (e) {
          emit(TunjanganDetailError("Gagal Memuat Data..."));
        }
    });
  }
}

Future<List<Datum>> fetchAPITunjangan() async {
  final myResponse = await http.get(Uri.parse("https://dev.laz-almuthiin.com/api/tunjangan_beras"));
  if(myResponse.statusCode == 200){
    Tunjangan data = tunjanganFromJson(myResponse.body);
    return data.data;
  }else{
    throw Exception("Gagal Mengambil Data...");
  }
}

Future<Data> fetchAPIDetailTunjangan() async{
  final myResponse = await http.get(Uri.parse("https://dev.laz-almuthiin.com/api/detil_tunjangan_beras"));
  if(myResponse.statusCode == 200){
    DetailTunjangan result = detailTunjanganFromJson(myResponse.body);
    return result.data;
  }else{
    throw Exception("Gagal Mengambil Data...");
  }
}
