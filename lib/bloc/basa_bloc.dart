import 'package:bloc/bloc.dart';
import 'package:konsumsi_api_bloc/model/model_basa.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'basa_event.dart';
part 'basa_state.dart';

class BasaBloc extends Bloc<BasaEvent, BasaState> {
  BasaBloc() : super(BasaInitial()) {
    on<GetBasaEvent>((event, emit) async {
      emit(BasaLoading());
      final response = await http
          .get(Uri.parse("https://hibersunda.onrender.com/undakusukbasa"));
      emit(BasaLoaded(basaFromJson(response.body)));
    });
  }
}
